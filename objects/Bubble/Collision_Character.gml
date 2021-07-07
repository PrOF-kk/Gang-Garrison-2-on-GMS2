if(other.cloak)
    if(other.currentWeapon.readyToStab)
        exit;
if (other.team != team and !other.ubered and other.hp > 0)
{
    damageCharacter(ownerPlayer, other.id, hitDamage);
	
    if (alarm[0] > 10) {
        alarm[0] = alarm[0] div 2;
    }
    else {
        instance_destroy();
    }
    
    if (other.lastDamageDealer != ownerPlayer && other.lastDamageDealer != other.player)
    {
        other.secondToLastDamageDealer = other.lastDamageDealer;
        other.alarm[4] = other.alarm[3]
    }
    other.alarm[3] = ASSIST_TIME / global.delta_factor;
    
    other.lastDamageDealer = ownerPlayer;
    other.lastDamageSource = weapon;
    instance_destroy();
}



