var oid, newx, newy;
playsound(x,y,MinegunSnd);
ammoCount = max(0, ammoCount-1);

oid = createShot(x+lengthdir_x(10,owner.aimDirection),y+lengthdir_y(10,owner.aimDirection), Mine, DAMAGE_SOURCE_MINEGUN, owner.aimDirection, 12);
oid.image_angle = 0;
lobbed += 1;
justShot=true;
readyToShoot = false;
alarm[0] = refireTime / global.delta_factor;
alarm[5] = (reloadBuffer + reloadTime) / global.delta_factor;


