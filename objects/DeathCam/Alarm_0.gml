if instance_exists(WinBanner)
{
    instance_destroy();
    exit;
}

if(lastDamageSource == DamageSource.SENTRYTURRET and killedby.sentry)
{
    __view_set( e__VW.XView, 0, killedby.sentry.x-400 );
    __view_set( e__VW.YView, 0, killedby.sentry.y-300 );
    hp=killedby.sentry.hp;
    maxHp=killedby.sentry.maxHp;
    killmessage = "You were killed by the autogun of";
}
else if(killedby.object != -1)
{
    __view_set( e__VW.XView, 0, killedby.object.x-400 );
    __view_set( e__VW.YView, 0, killedby.object.y-300 );
    hp=killedby.object.hp;
    maxHp=killedby.object.maxHp;
    killmessage = "You were killed by";
}
else
{
    __view_set( e__VW.XView, 0, killedby.lastKnownx-400 );
    __view_set( e__VW.YView, 0, killedby.lastKnowny-300 );
    hp=0;
    maxHp=0;
    killmessage = "You were killed by the late";
}

screen_redraw();

var tempfile;
tempfile = temp_directory + "/deathcam.png";
if !file_exists(tempfile)
    screen_save_part(tempfile,0,0,800,600);
DeathCamS=sprite_add(tempfile,1,0,0,400,300);
file_delete(tempfile);

zooming=true;
playsound(__view_get( e__VW.XView, 0 )+400,__view_get( e__VW.YView, 0 )+300,DeathCamSnd);

