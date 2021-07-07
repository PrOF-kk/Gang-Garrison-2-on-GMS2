var targetQueue, testDist, playercheck, targetAngle, obscured, rotateoffset;

if(ownerPlayer.sentry)
{
    x = ownerPlayer.sentry.x;
    y = ownerPlayer.sentry.y;
}
else
{
    instance_destroy();
    exit;
}

if(((direction+270) mod 360)>180) {
    image_xscale=1;
    image_angle = direction;
} else {
    image_xscale=-1;
    image_angle = direction+180;
}

nearestTarget = noone;
targetQueue = ds_priority_create();

// Build a queue of potential targets
with(Character) {
    testDist = distance_to_object(other);
    if(!cloak && testDist<=375) {
        ds_priority_add(targetQueue, id, testDist);
    }
}

with(Sentry) {
    testDist = distance_to_object(other);
    if(testDist<=375) {
        ds_priority_add(targetQueue, id, testDist);
    }
}

gunSetSolids();
while(!nearestTarget && !ds_priority_empty(targetQueue)) {
    playercheck = ds_priority_delete_min(targetQueue);
    targetAngle = point_direction(x,y,playercheck.x,playercheck.y);
    if((targetAngle <= 45 || targetAngle >= 315 || (targetAngle >= 135 && targetAngle <= 225) || place_meeting(x,y,playercheck)) 
        && playercheck.team != team 
        && playercheck.hp > 0
        && !collision_line_bulletblocking(x, y, playercheck.x, playercheck.y)) {
            // Target looks valid, but it might be obscured by a sentry.
            // That has to be tested individually because we have to exclude both this sentry and the target
            // from the collision check
            obscured = false;
            with(Sentry) {
                if(!obscured && id != other.ownerPlayer.sentry && id != playercheck && collision_line(other.x,other.y,playercheck.x,playercheck.y,id,false,false)>=0) {
                    obscured = true;
                }
            }
            if(!obscured) {
                nearestTarget = playercheck;
            }
        }
}
ds_priority_destroy(targetQueue);

if(!nearestTarget) {
    noticedTarget = true;
    if(image_xscale>0)
        direction = 0;
    else
        direction = 180;
        
    if image_xscale != startDirection {
        rotating=true;
    }
} else {
    // set cloaked spy as target if they're in the way
    with(Spy) {
        if(team != other.team && collision_line(other.x,other.y,other.nearestTarget.x,other.nearestTarget.y,id,true,false)>=0) {
            other.nearestTarget = id;
        }
    }
    
    if(nearestTarget.x < x && image_xscale == 1) {
        rotating=true;
    } else if(nearestTarget.x > x && image_xscale == -1) {
        rotating=true;
    }    
        
    if (noticedTarget == true) {
        playsound(x,y,SentryAlert);
        readyToShoot = false;
        alarm[0] = refireTime*2 / global.delta_factor;
    }    
    
    noticedTarget = false;
    
    if(readyToShoot && (rotating == false)) {
        direction = point_direction(x,y,nearestTarget.x,nearestTarget.y);
        
        // Prevent the turret from turning too high even if it is shooting in that direction.
        // This hides the exception to the angle restriction that occurs when a player is standing
        // directly on the sentry gun. 
        if(direction>=45 and direction<90) direction=45;
        else if(direction>=90 and direction<135) direction=135;
        else if(direction>=225 and direction<270) direction=225;
        else if(direction>=270 and direction<315) direction=315;
        
        playsound(x,y,ShotgunSnd);
        ownerPlayer.sentry.idleTimer = false;
        ownerPlayer.sentry.alarm[5] = 30 / global.delta_factor;
        
        if(nearestTarget.ubered == 0) {
            damageAuto(ownerPlayer, nearestTarget, hitDamage);
            if (nearestTarget.lastDamageDealer != ownerPlayer && object_is_ancestor(nearestTarget.object_index, Character)) {
                if (nearestTarget.lastDamageDealer != nearestTarget.player){
                    nearestTarget.secondToLastDamageDealer = nearestTarget.lastDamageDealer;
                    nearestTarget.alarm[4] = nearestTarget.alarm[3];
                }
            }
            nearestTarget.alarm[3] = ASSIST_TIME / global.delta_factor;
            nearestTarget.lastDamageDealer = ownerPlayer;
            nearestTarget.lastDamageSource = DAMAGE_SOURCE_SENTRYTURRET;
            if(global.gibLevel > 0 and object_is_ancestor(nearestTarget.object_index, Character))
            {
                blood = instance_create(nearestTarget.x,nearestTarget.y,Blood);
                blood.direction = direction-180;
                dealFlicker(nearestTarget);
            }
        }
        shooting=true;
        readyToShoot=false;
        alarm[0]=refireTime / global.delta_factor;
    }
}
gunUnsetSolids();

if(rotating) {
    rotateindex += 0.3 * global.delta_factor;
    if(rotateindex >= rotateend) {
        image_xscale = -image_xscale;
        direction += 180;
        rotating = false;
        rotateindex = rotatestart;
    }
}

