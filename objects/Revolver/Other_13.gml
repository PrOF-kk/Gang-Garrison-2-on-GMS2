ammoCount = max(0, ammoCount-1);
playsound(x,y,RevolverSnd);
var shot;

shot = createShot(x,y + yoffset + 1,Shot, DamageSource.REVOLVER, owner.aimDirection, 21);
shot.hitDamage = 28;
if(golden)
    shot.sprite_index = ShotGoldS;
with(shot)
    speed += owner.hspeed*hspeed/15;

// Move shot forward one 30fps step to avoid immediate collision with a wall behind the character
// delta_factor is left out intentionally!
shot.x += lengthdir_x(shot.speed, shot.direction);
shot.y += lengthdir_y(shot.speed, shot.direction);
    
justShot=true;
readyToShoot=false;
alarm[0] = refireTime / global.delta_factor;
alarm[5] = (reloadBuffer + reloadTime) / global.delta_factor;
alarm[7] = alarm[5] * 3 / 5;

