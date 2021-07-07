{
    xoffset = -11;
    yoffset = 0;
    refireTime = 2;
    event_inherited();
    
    sndlooping = false;
    maxAmmo = 200;
    ammoCount = maxAmmo;
    reloadBuffer = 10;
    isRefilling = false;
    
    if(golden)
    {
        normalSprite = MinigunGoldS;
        recoilSprite = MinigunGoldFS;
        reloadSprite = -1;
    }
    else
    {
        normalSprite = MinigunS;
        recoilSprite = MinigunFS;
        reloadSprite = -1;
    }
    sprite_index = normalSprite;
    
    //play at least 2 frames
    recoilTime = 3;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    //Overlays for the overheat
    overlaySprite = MinigunOverlayS;
    overlayFiringSprite = MinigunOverlayFS;
}

