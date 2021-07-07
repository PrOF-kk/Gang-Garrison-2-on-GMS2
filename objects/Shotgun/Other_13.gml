ammoCount = max(0, ammoCount-1);
playsound(x,y,ShotgunSnd);
var shot;
repeat(5) {
    shot = createShot(x, y, Shot, DAMAGE_SOURCE_SHOTGUN, owner.aimDirection, 13);
    shot.hitDamage = 7;
    if(golden)
        shot.sprite_index = ShotGoldS;
    
    shot.hspeed += owner.hspeed;
    shot.speed += random(4)-2;
    shot.direction += random(11)-5.5;
    // Move shot forward to avoid immediate collision with a wall behind the character
    shot.x += lengthdir_x(15, shot.direction);
    shot.y += lengthdir_y(15, shot.direction);
}
justShot=true;
readyToShoot=false;
alarm[0] = refireTime / global.delta_factor;
alarm[5] = (reloadBuffer + reloadTime) / global.delta_factor;
alarm[7] = alarm[0] / 2;

