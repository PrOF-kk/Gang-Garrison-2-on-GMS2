{
    xoffset = -11;
    yoffset = 4;
    refireTime = 1;
    event_inherited();
    
    blastDistance = 150;
    blastAngle = 75;
    blastStrength = 28;
    characterBlastStrength = 15;
    blastNoFlameTime = 15;
    blastReloadTime = 40;
    flareReloadTime = 55;
    alarm[1] = blastReloadTime / global.delta_factor;
    alarm[2] = flareReloadTime / global.delta_factor;
    readyToBlast = false;
    readyToFlare = false;
    justBlast = false;
    
    maxAmmo = 200;
    ammoCount = maxAmmo;
    soundLoopTime = 30;
    currentTime = 0;
    
    reloadBuffer = 7;
    isRefilling = false;
    
    if(golden)
    {
        normalSprite = FlamethrowerGoldS;
        recoilSprite = FlamethrowerGoldFS;
        blastSprite = FlamethrowerGoldBlastS;
        dropSprite = FlamethrowerGoldDropS;
        reloadsprite = -1;
    }
    else
    {
        normalSprite = FlamethrowerS;
        recoilSprite = FlamethrowerFS;
        blastSprite = FlamethrowerBlastS;
        dropSprite = FlamethrowerDropS;
        reloadSprite = -1
    }
    sprite_index = normalSprite;
    
    //play at least 2 frames
    recoilTime = 3;
    recoilAnimLength = sprite_get_number(recoilSprite)/2;
    recoilImageSpeed = recoilAnimLength/recoilTime;
    
    blastAnimLength = sprite_get_number(blastSprite)/2;
    blastImageSpeed = blastAnimLength/blastNoFlameTime;

    dropTime = 4;
    dropAnimLength = sprite_get_number(dropSprite)/2;
    dropImageSpeed = dropAnimLength/dropTime;
}

