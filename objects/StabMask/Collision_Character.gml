if(other.id != ownerPlayer.object and other.team != team  and other.hp > 0 and !other.ubered)
{
    var connecting, otherId;
    connecting = false;
    otherId = other.id;
    if(ownerPlayer.object != -1)
    {
        with(ownerPlayer.object)
            connecting |= place_meeting(x, y, otherId);
    }
    connecting |= !collision_line_bulletblocking(x, y-12, other.x, other.y);
    if(connecting)
    {
        damageCharacter(ownerPlayer, other.id, hitDamage);
        if (other.lastDamageDealer != ownerPlayer && other.lastDamageDealer != other.player)
        {
            other.secondToLastDamageDealer = other.lastDamageDealer;
            other.alarm[4] = other.alarm[3]
        }
        other.alarm[3] = ASSIST_TIME / global.delta_factor;
        other.lastDamageDealer = ownerPlayer;
        if sign(other.image_xscale) == sign(image_xscale)
            other.lastDamageSource = DamageSource.BACKSTAB;
        else
            other.lastDamageSource = DamageSource.KNIFE;
        var blood;
        if(global.gibLevel > 0)
        {
            repeat(70)
            {
                blood = instance_create(x,y,Blood);
                blood.direction = direction-180;
            }
        }
        
        numKills += 1;
        if (numKills >= maxKills)
            instance_destroy();
    }
    else
        instance_destroy();
}

