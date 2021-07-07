{
    if(other.id != ownerPlayer.object and other.team != team)
    {
        if(!other.ubered)
        { 
            damageCharacter(ownerPlayer, other.id, hitDamage);
            other.timeUnscathed = 0;
            if (other.lastDamageDealer != ownerPlayer and other.lastDamageDealer != other.player)
            {
                other.secondToLastDamageDealer = other.lastDamageDealer;
                other.alarm[4] = other.alarm[3]
            }
            other.alarm[3] = ASSIST_TIME / global.delta_factor;
            other.lastDamageDealer = ownerPlayer;
            other.lastDamageSource = weapon;
            var blood;
            if(global.gibLevel > 0)
            {
                repeat(25)
                {
                    blood = instance_create(x,y,Blood);
                    blood.direction = direction-180;
                }
            }
        }
        with(other)
            motion_add(other.direction, other.speed*0.4);
        dealFlicker(other.id);
        
        instance_destroy();
    }
}

