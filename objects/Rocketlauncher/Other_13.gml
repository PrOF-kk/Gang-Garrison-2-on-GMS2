ammoCount = max(0, ammoCount-1);    
playsound(x,y,RocketSnd);
var oid, newx, newy;
newx = x+lengthdir_x(20,owner.aimDirection);
newy = y+lengthdir_y(20,owner.aimDirection);
oid = createShot(newx, newy, Rocket, DAMAGE_SOURCE_ROCKETLAUNCHER, owner.aimDirection, 13);
oid.gun=id;
with (oid)
{
    if (collision_line_bulletblocking(other.x, other.y, newx, newy))
    {
        // Delay explosion to make same-frame rocketjumping work reliably
        explodeImmediately = true;
    }
}
oid.lastknownx = owner.x;
oid.lastknowny = owner.y;
justShot=true;
readyToShoot = false;
alarm[0] = refireTime / global.delta_factor;
alarm[5] = (reloadBuffer + reloadTime) / global.delta_factor;

