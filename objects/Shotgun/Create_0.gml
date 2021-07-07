{
    xoffset = -5;
    yoffset = -2;
    refireTime = 20;
    event_inherited();
    
    maxAmmo = 6;
    ammoCount = maxAmmo;
    reloadTime = 15;
    reloadBuffer = 20;
    idle=true;
    
    if(golden)
    {
        normalSprite = ShotgunGoldS;
        recoilSprite = ShotgunGoldFS;
        reloadSprite = ShotgunGoldFRS;
    }
    else
    {
        normalSprite = ShotgunS;
        recoilSprite = ShotgunFS;
        reloadSprite = ShotgunFRS;
    }
    sprite_index = normalSprite;

    recoilTime = refireTime;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    reloadAnimLength = sprite_get_number(reloadSprite)/2;
    reloadImageSpeed = reloadAnimLength/reloadTime;
}

