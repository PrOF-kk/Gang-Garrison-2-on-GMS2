{
    xoffset = 0;
    yoffset = -3;
    refireTime = 5;
    event_inherited();
    
    bubbleRefireTime = 4;
    replenishing = 1;
    bubbleCount = 0;
    maxBubbles = 25;
    bladesOut = 0;
    bladeLife = 15;
    maxBlades = 1;
    bladeDamage = 17;
    depletedBladeDamage = 8;
    maxAmmo = 90;
    replenishingRate = 2;
    ammoCount = maxAmmo;
    lowAmmoThreshold = 1/3 * maxAmmo;
    highAmmoThreshold = 2/3 * maxAmmo;
    reloadTime = 55;
    reloadBuffer = 0;
    
    if(golden)
    {
        normalSprite = BladeGoldS;
        recoilSprite = BladeGoldFS;
    }
    else
    {
        normalSprite = BladeS;
        recoilSprite = BladeFS;
    }
    reloadSprite = -1;
    sprite_index = normalSprite;
    
    recoilTime = 1;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
}

