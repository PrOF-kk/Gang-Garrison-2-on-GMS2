{
    xoffset = -15;
    yoffset = -10;
    refireTime = 30;
    event_inherited();
    
    reloadTime = 22;
    reloadBuffer = 30;
    maxAmmo = 4;
    ammoCount = maxAmmo;
    rocketrange = 501;
    idle=true;
    
    if(golden)
    {
        normalSprite = RocketlauncherGoldS;
        recoilSprite = RocketlauncherGoldFS;
        reloadSprite = RocketlauncherGoldFRS;
    }
    else
    {
        normalSprite = RocketlauncherS;
        recoilSprite = RocketlauncherFS;
        reloadSprite = RocketlauncherFRS;
    }
    sprite_index = normalSprite;
    
    recoilTime = refireTime;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    reloadAnimLength = sprite_get_number(reloadSprite)/2;
    reloadImageSpeed = reloadAnimLength/reloadTime;
}

