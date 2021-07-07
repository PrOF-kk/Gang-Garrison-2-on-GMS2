if (built==1)
{
    with(currentWeapon)
        instance_destroy();
}
if (global.myself == ownerPlayer)
{
    if !instance_exists(NoticeO) instance_create(0,0,NoticeO);
    with NoticeO notice = NOTICE_AUTOGUNSCRAPPED;
}

// Allow the mines stickied to this autogun to drop to the floor
with(Mine)
{
    if(place_meeting(x,y,other.id))
        stickied = false;
}

// Knock back our owner
with(ownerPlayer.object)
{
    if (distance_to_object(other) < other.blastRadius
        and !place_meeting(x, y+1, Obstacle))
    {
        var rdir, vectorfactor;
        rdir = point_direction(other.x, other.y, x+(left_bound_offset+right_bound_offset)/2, y+(top_bound_offset+bottom_bound_offset)/2);
        vectorfactor = point_distance(0, 0, power(sin(degtorad(rdir)), 2), power(cos(degtorad(rdir)), 2));
        if (1 - distance_to_object(other)/other.blastRadius <= 0.25)
            continue;
        motion_add(rdir, min(15, other.knockback-other.knockback*(distance_to_object(other)/other.blastRadius)) * vectorfactor);
    } 
}

ownerPlayer.sentry = noone;
var explosion;
explosion = instance_create(x,y,Explosion);
explosion.sprite_index = ExplosionSmallS;
playsound(x,y,ExplosionSnd);
sentrygibs=instance_create(x,y,SentryGibs);
sentrygibs.image_speed = 0;
if (team == TEAM_RED)
    sentrygibs.image_index = 0;
else
    sentrygibs.image_index = 1;

