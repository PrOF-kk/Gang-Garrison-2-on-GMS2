{
    xoffset = -5;
    yoffset = -8;
    refireTime = 40;
    event_inherited();
    
    reloadTime = 40;
    unscopedDamage = 35;
    baseDamage = 45;
    maxDamage = 75;
    chargeTime = 105;
    hitDamage=baseDamage;
    maxAmmo = 0;
    ammoCount = maxAmmo;
    shot=false;
    t=0;
    
    if(golden)
    {
        normalSprite = RifleGoldS;
        recoilSprite = RifleGoldFS;
        reloadSprite = RifleGoldFRS;
    }
    else
    {
        normalSprite = RifleS;
        recoilSprite = RifleFS;
        reloadSprite = RifleFRS;
    }
    sprite_index = normalSprite;
    
    recoilTime = 15;
    recoilAnimLength = sprite_get_number(recoilSprite)/2
    recoilImageSpeed = recoilAnimLength/recoilTime

    longRecoilTime = 60;
    reloadAnimLength = sprite_get_number(reloadSprite)/2
    reloadImageSpeed = reloadAnimLength/(longRecoilTime);
    
    tracerAlpha = 0;
}

