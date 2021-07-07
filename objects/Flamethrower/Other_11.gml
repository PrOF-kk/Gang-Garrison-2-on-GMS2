{
    var newx, newy;
    newx = x+lengthdir_x(25,owner.aimDirection);
    newy = y+lengthdir_y(25,owner.aimDirection) + owner.equipmentOffset;
    // prevent sputtering
    if (ammoCount < 1.8)
        ammoCount -= 1.8;
    if (readyToShoot and ammoCount >= 1.8
        and !collision_line_bulletblocking(x,y,newx,newy))
    {
        if(alarm[3] <= 0)
            loopsoundstart(x,y,FlamethrowerSnd);
        else
            loopsoundmaintain(x,y,FlamethrowerSnd);
        alarm[3] = 2 / global.delta_factor;
        
        var shot, calculatedspread;
        randomize();
        calculatedspread = sign(random(2)-1)*power(random(3), 1.8);
        calculatedspread *= 1 - hspeed/owner.basemaxspeed;
        shot = createShot(newx, newy, Flame, DAMAGE_SOURCE_FLAMETHROWER, owner.aimDirection+calculatedspread,6.5+random(3.5));
        with(shot)
            motion_add(owner.direction, owner.speed);
        
        justShot=true;
        readyToShoot=false;
        isRefilling = false;
        ammoCount -= 1.8;
        
        if (ammoCount > 0)
            alarm[0] = refireTime / global.delta_factor;
        else
            alarm[0] = reloadBuffer*2 / global.delta_factor;
        alarm[5] = reloadBuffer / global.delta_factor;
    }
}

