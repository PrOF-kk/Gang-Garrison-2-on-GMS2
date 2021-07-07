{
    xoffset = -3;
    yoffset = -2;
    refireTime = 26;
    event_inherited();
    
    maxMines = 8;
    lobbed = 0;
    reloadTime = 15;
    reloadBuffer = 26;
    maxAmmo = 8;
    ammoCount = maxAmmo;
    idle=true;
    
    if(golden)
    {
        normalSprite = MinegunGoldS;
        recoilSprite = MinegunGoldFS;
        reloadSprite = MinegunGoldFRS;
    }
    else
    {
        normalSprite = MinegunS;
        recoilSprite = MinegunFS;
        reloadSprite = MinegunFRS;
    }
    sprite_index = normalSprite;
    
    recoilTime = refireTime;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    reloadAnimLength = sprite_get_number(reloadSprite)/2;
    reloadImageSpeed = reloadAnimLength/reloadTime;
}

