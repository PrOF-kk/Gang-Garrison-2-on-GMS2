{
    xoffset = -5;
    yoffset = -4;
    refireTime = 20;
    event_inherited();
    
    maxAmmo = 6
    ammoCount = maxAmmo;
    reloadTime = 15;
    reloadBuffer = 20;
    idle=true;
    
    if(golden)
    {
        normalSprite = ScattergunGoldS;
        recoilSprite = ScattergunGoldFS;
        reloadSprite = ScattergunGoldFRS;
    }
    else
    {
        normalSprite = ScattergunS;
        recoilSprite = ScattergunFS;
        reloadSprite = ScattergunFRS;
    }
    sprite_index = normalSprite;
    
    recoilTime = refireTime;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    reloadAnimLength = sprite_get_number(reloadSprite)/2;
    reloadImageSpeed = reloadAnimLength/reloadTime;
}

