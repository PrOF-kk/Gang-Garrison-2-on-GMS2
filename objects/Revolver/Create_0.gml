{
    xoffset = -3;
    yoffset = -6;
    refireTime = 18;
    event_inherited();
    
    StabreloadTime = 32;
    readyToStab = true;

    stabdirection=0;
    maxAmmo = 6;
    ammoCount = maxAmmo;
    ejected = 0;
    reloadTime = 45;
    reloadBuffer = refireTime;
    idle=true;
    
    if(golden)
    {
        normalSprite = RevolverGoldS;
        recoilSprite = RevolverGoldFS;
        reloadSprite = RevolverGoldFRS;
    }
    else
    {
        normalSprite = RevolverS;
        recoilSprite = RevolverFS;
        reloadSprite = RevolverFRS;
    }
    sprite_index = normalSprite;
    
    recoilTime = refireTime;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    reloadAnimLength = sprite_get_number(reloadSprite)/2;
    reloadImageSpeed = reloadAnimLength/reloadTime;
}

