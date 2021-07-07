if(other.team != team)
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
        damageSentry(ownerPlayer, other.id, hitDamage);
        other.lastDamageDealer = ownerPlayer;
        other.lastDamageSource = weapon;
        
        numKills += 1;
        if numKills >= maxKills
            instance_destroy();
    }
    else
        instance_destroy();
}

