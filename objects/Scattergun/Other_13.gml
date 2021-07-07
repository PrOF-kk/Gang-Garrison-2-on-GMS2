ammoCount = max(0, ammoCount-1);
playsound(x,y,ShotgunSnd);
var shot;
repeat(6) {
    shot = createShot(x, y, Shot, DamageSource.SCATTERGUN, owner.aimDirection, 13);
    if(golden)
        shot.sprite_index = ShotGoldS;
    shot.hspeed += owner.hspeed;
    shot.speed += random(4)-2;
    shot.direction += random(15)-7.5;
    // Move shot forward to avoid immediate collision with a wall behind the character
    shot.x += lengthdir_x(15, shot.direction);
    shot.y += lengthdir_y(15, shot.direction);
    shot.alarm[0] = 35 * ((min(1, abs(cos(degtorad(owner.aimDirection)))*13
                          /abs(cos(degtorad(owner.aimDirection))*13+owner.hspeed))-1)/2+1)
                    / global.delta_factor;
}
justShot = true;
readyToShoot = false;
alarm[0] = refireTime / global.delta_factor;
alarm[5] = (reloadBuffer + reloadTime) / global.delta_factor;

