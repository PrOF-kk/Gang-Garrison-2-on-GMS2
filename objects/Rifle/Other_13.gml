playsound(x,y,SniperSnd);
shot=true;
justShot=true;
readyToShoot = false;
alarm[0] = (reloadTime + 20*owner.zoomed) / global.delta_factor;
alarm[7] = (reloadTime/4 + 10*owner.zoomed) / global.delta_factor;  // Eject a shell during the animation

// for drawing:
tracerAlpha = 0.8;
shotx = x;
shoty = y;

var x1, y1, xm, ym, leftmostX, len;
len = 1500*(((hitDamage*100)/maxDamage)/100)
x1 = x;
y1 = y;
x2 = x+lengthdir_x(len, owner.aimDirection);
y2 = y+lengthdir_y(len, owner.aimDirection);
leftmostX = min(x1, x2);

gunSetSolids();
alarm[6] = alarm[0];

// We do a hitscan test here to figure out how far the rifle shot actually goes before it hits something.
// This works by binary search through collision_line tests on ever smaller segments of our ray.
//
// Unfortunately, collision_line can only check for collision against either *all* instances, or instances of one
// object, or just a single instance. What we need however is to check against *some* instances of *some* objects.
// 
// We could make a list of all instances that should stop the bullet and check each of them individually, but that
// could be slow.
// 
// So here is how we do this instead: We do several collision_line checks, but only on an object basis.
// Those instances which are instances of those objects, but should not stop the bullets are set to an empty
// collision mask, and that is reverted after we are done.

var bulletStoppingObjects, originalMask, hitInstance;
bulletStoppingObjects = ds_list_create();
originalMask = ds_map_create();
hitInstance = noone;

ds_list_add(bulletStoppingObjects, Obstacle);
ds_list_add(bulletStoppingObjects, Generator);
ds_list_add(bulletStoppingObjects, Character);
ds_list_add(bulletStoppingObjects, Sentry);
if(!global.mapchanging)
    ds_list_add(bulletStoppingObjects, TeamGate);
ds_list_add(bulletStoppingObjects, IntelGate);
if(areSetupGatesClosed())
    ds_list_add(bulletStoppingObjects, ControlPointSetupGate);
ds_list_add(bulletStoppingObjects, BulletWall);

// Set the collision mask of all instances which should not collide to an empty one
with(Generator) {
    if(team == other.owner.team) {
        ds_map_add(originalMask, id, mask_index);
        mask_index = emptyMaskS;
    }
}

with(Sentry) {
    if(team == other.owner.team) {
        ds_map_add(originalMask, id, mask_index);
        mask_index = emptyMaskS;
    }
}

with(owner) {
    ds_map_add(originalMask, id, mask_index);
    mask_index = emptyMaskS;
}

// Find the first instance the ray collides with
var hit, i;
while(len>1) {
    xm=(x1+x2)/2;
    ym=(y1+y2)/2;
    
    hit = noone;
    for(i = 0; (i < ds_list_size(bulletStoppingObjects)) and !hit; i += 1) {
        hit = collision_line(x1, y1, xm, ym, ds_list_find_value(bulletStoppingObjects, i), true, true);
    }
    
    if(hit) {
        x2=xm;
        y2=ym;
        hitInstance = hit;
    } else {
        x1=xm;
        y1=ym;
    }
    len/=2;
}

// Re-assign the original collision masks
var key, origMask;
for(key = ds_map_find_first(originalMask); key; key = ds_map_find_next(originalMask, key)) {
    origMask = ds_map_find_value(originalMask, key);
    with(key) {
        mask_index = origMask;
    }
}

ds_map_destroy(originalMask);
ds_list_destroy(bulletStoppingObjects);

// Apply dramatic effect
with(hitInstance) {
    if(object_index == Character or object_is_ancestor(object_index, Character)) {
        if(!ubered and team != other.owner.team) {
            damageCharacter(other.ownerPlayer, id, other.hitDamage);
            if (lastDamageDealer != other.ownerPlayer and lastDamageDealer != player)
            {
                secondToLastDamageDealer = lastDamageDealer;
                alarm[4] = alarm[3]
            }
            alarm[3] = ASSIST_TIME / global.delta_factor;
            lastDamageDealer = other.ownerPlayer;
            dealFlicker(id);
            if(global.gibLevel > 0)
            {
                blood = instance_create(x, y, Blood);
                blood.direction = other.owner.aimDirection - 180;
            }
            if (!other.owner.zoomed) {
                lastDamageSource = DamageSource.RIFLE;
            } else {
                lastDamageSource = DamageSource.RIFLE_CHARGED;
            }
        }
    } else if(object_index == Sentry or object_is_ancestor(object_index, Sentry)) {
        damageSentry(other.ownerPlayer, id, other.hitDamage);
        lastDamageDealer = other.ownerPlayer;
        if (!other.owner.zoomed)
            lastDamageSource = DamageSource.RIFLE;
        else
            lastDamageSource = DamageSource.RIFLE_CHARGED;
    } else if(object_index == Generator or object_is_ancestor(object_index, Generator)) {
        damageGenerator(other.ownerPlayer, id, other.hitDamage);
    }
}

gunUnsetSolids();


