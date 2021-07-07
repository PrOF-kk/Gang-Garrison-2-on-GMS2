    gunSetSolids();
    if (!place_free(x, y)) 
    {
        instance_destroy();
        gunUnsetSolids();
        exit;
    }
    gunUnsetSolids();

    if(other.id != ownerPlayer.object and other.team != team  && other.hp > 0 && other.ubered == 0)
    {
        damageCharacter(ownerPlayer, other.id, hitDamage);
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
            blood = instance_create(x,y,Blood);
            blood.direction = direction-180;
        }
        dealFlicker(other.id);
        with(other)
        {
            motion_add(other.direction, other.speed*0.03);
        }
        instance_destroy();
    }


