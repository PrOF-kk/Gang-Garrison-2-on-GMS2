{
    xoffset = -7;
    yoffset = 0;
    refireTime = 3;
    event_inherited();
    
    healTarget = noone;
    healedThisStep = false;
    healAmount = 2/3;
    hphealed = 0;
    maxHealDistance = 300;
    maxMouseSelectDistance = 150; // Heal target selection will favor the character closest to the mouse, as long as it is within this distance of the mouse cursor.
    ubering = false;
    uberCharge=0;
    uberReady=false;
    maxAmmo = 40
    ammoCount = maxAmmo;
    reloadTime = 55;
    reloadBuffer = 0;
    idle=true;
    
    // Threshhold system numbers
    healTierHealth = 125; // HP above which healing is slowed
    healTierAmount = 0.75; // Factor to which healing is slowed (stacks with healing ramp)
    
    if(golden)
    {
        normalSprite = MedigunGoldS;
        recoilSprite = MedigunGoldFS;
        reloadSprite = MedigunGoldFRS;
    }
    else
    {
        normalSprite = MedigunS;
        recoilSprite = MedigunFS;
        reloadSprite = MedigunFRS;
    }
    sprite_index = normalSprite;
        
    //This makes it so that the timer will keep resetting
    //Until Mouse1 is let go
    recoilTime = refireTime+1;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    reloadAnimLength = sprite_get_number(reloadSprite)/2;
    reloadImageSpeed = reloadAnimLength/reloadTime;
}

