if(other.id != ownerPlayer.object and other.team != team and other.ubered == 0  and other.hp > 0)
{
    if (ds_list_find_index(enemiesHit,other.id) != -1)
        exit;
        
    damageCharacter(ownerPlayer, other.id, hitDamage);
        
    if (other.lastDamageDealer != ownerPlayer and other.lastDamageDealer != other.player)
    {
        other.secondToLastDamageDealer = other.lastDamageDealer;
        other.alarm[4] = other.alarm[3];
    }
    other.alarm[3] = ASSIST_TIME / global.delta_factor;
    other.lastDamageDealer = ownerPlayer;
    other.lastDamageSource = weapon;
    
    // afterburn stuff
    {
        other.burnDuration += durationIncrease; 
        
        var falloffAmount;
        falloffAmount = min(1, // factor can't exceed 1
            (flameLife - alarm[0]*global.delta_factor) // value higher when life is fresh (alarm 0 is high)
            /flameLife); // normalize to 1
        if(afterburnFalloff)
            falloffFactor = falloffAmount*0.65+0.35; // Reduce heat additions of "old"/distant flames -- 0.35 to 1.0 "curve"
        else
            falloffFactor = 1;
        
        if(other.burnIntensity > other.legIntensity and afterburnFalloff) // reduce heat additions above the "leg" heat
            falloffFactor /= 2;
        
        other.burnIntensity += burnIncrease * falloffFactor;
            
        other.burnDuration = min(other.burnDuration, other.maxDuration);
        other.burnIntensity = min(other.burnIntensity, other.maxIntensity);
        
        other.burnedBy = ownerPlayer;
        other.afterburnSource = weapon;
        other.alarm[0] = other.decayDelay / global.delta_factor;
    }
    dealFlicker(other.id);
    
    if (ds_list_size(enemiesHit) >= penetrateCap and !perseverant)
        instance_destroy();
    else
        ds_list_add(enemiesHit, other.id);
}

