if(global.isHost and (ownerPlayer.class != CLASS_ENGINEER or team != ownerPlayer.team or collision_circle(x,y+10,25,Sentry,false,true)>=0))
{
    sendEventDestruction(ownerPlayer, noone, noone, 0);
    doEventDestruction(ownerPlayer, noone, noone, 0);
    exit;
}

if (built == 0 and vspeed == 0)
{
    if (hp < maxHp)
        hp += buildrate * global.delta_factor;
    else
        built = 1;
    buildrate = min(buildrate, buildrate+(0.6*global.delta_factor/45)); // Buildrate increases from 0.5 to 1 over 1.5 seconds
    image_index = floor(hp/maxHp*10);
    if (landed == 0)
    {
        landed = 1;
        playsound(x,y,SentryFloorSnd);
        playsound(x,y,SentryBuildSnd);
    }  
}

if (built == 1 and currentWeapon == -1)
{
    image_index=11;
    image_speed=0;
    hp=maxHp;
    currentWeapon = instance_create(x,y,weapons[0]);
    currentWeapon.ownerPlayer=ownerPlayer;
    currentWeapon.team=team;
    currentWeapon.startDirection=startDirection;
    with(currentWeapon)
        event_user(0);
}
if (humiliated == 1 and built == 1 and currentWeapon != -1)
    event_user(1);
    
wallSetSolid();

// Try to get outside of the wallmask if we're in it.
if(!place_free(x, y))
    move_outside_solid(0, 6);
if(!place_free(x, y))
    move_outside_solid(180, 12);
if(!place_free(x, y))
{
    move_outside_solid(0, 6);
    move_outside_solid(90, 100);
}

if(place_free(x+hspeed, y+vspeed+0.6))
    vspeed += 0.6  * global.delta_factor;
if(!place_free(x+hspeed, y+vspeed) and place_free(x, y))
    event_user(2);

if(vspeed > 10)
    vspeed = 10;

wallUnsetSolid();

if(oldVspeed != 0 and vspeed == 0 and global.isHost)
{
    write_ubyte(global.sendBuffer, SENTRY_POSITION);
    write_ubyte(global.sendBuffer, ds_list_find_index(global.players, ownerPlayer));
    write_ushort(global.sendBuffer, round(x*5));
    write_ushort(global.sendBuffer, round(y*5));
}

oldVspeed = vspeed;

x += hspeed * global.delta_factor;
y += vspeed * global.delta_factor;
x -= hspeed;
y -= vspeed;


