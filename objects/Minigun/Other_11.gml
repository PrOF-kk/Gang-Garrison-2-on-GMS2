{
    // prevent sputtering
    if (ammoCount < 2)
        ammoCount -= 2;
    if(readyToShoot and ammoCount >= 2)
    {
        playsound(x,y,ChaingunSnd);
        var shot, shotx, shoty;
        randomize();
        
        shotx = x+lengthdir_x(20,owner.aimDirection);
        shoty = y+12+lengthdir_y(20,owner.aimDirection);
        if(!collision_line_bulletblocking(x, y, shotx, shoty))
        {
            shot = createShot(shotx, shoty, Shot, DamageSource.MINIGUN, owner.aimDirection+(random(14)-7), 12+random(1));
            if(golden)
                shot.sprite_index = ShotGoldS;
            shot.hspeed += owner.hspeed;
            shot.alarm[0] = 30 / global.delta_factor;
        }
        else
        {
            var imp;
            imp = instance_create(shotx, shoty, Impact);
            imp.image_angle = owner.aimDirection;
        }
        
        justShot=true;
        readyToShoot=false;
        isRefilling = false;
        ammoCount -= 3;
        
        var reloadBufferFactor;
        if(ammoCount < 3)
            reloadBufferFactor = 2.5;
        else
            //reloadBufferFactor = 1+(cos((ammoCount+2.2)/maxAmmo*pi)+1)/2; // spline from (full ammo = 1*) to (empty ammo = 2*)
            reloadBufferFactor = 1;
        
        alarm[0] = refireTime / global.delta_factor;
        alarm[5] = reloadBuffer*reloadBufferFactor / global.delta_factor;
        
        if (global.particles == PARTICLES_NORMAL)
        {
            var shell;
            shell = instance_create(x, y+4, Shell);
            shell.direction = owner.aimDirection + (140 - random(40)) * image_xscale;
        }
    }
}

