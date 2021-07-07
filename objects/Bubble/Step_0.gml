//We want to move when the owner does, somewhat.
hspeed += owner.hspeed * 0.2 * global.delta_factor;
vspeed += owner.vspeed * 0.2 * global.delta_factor;

//We want to be near the crosshair, in respect to the player.
motion_add(owner.aimDirection, 2 * global.delta_factor);

//We want to stay in the circular area around the player.
motion_add(point_direction(owner.x, owner.y, x, y), -2 * arctan((point_distance(x, y, owner.x, owner.y)-90)/4) * global.delta_factor);

//The speed should stay around 3.3, which this code stablizes the speed to.
speed = (speed + 2.2 * global.delta_factor) * delta_mult(0.6);

x += hspeed * global.delta_factor;
y += vspeed * global.delta_factor;
x -= hspeed;
y -= vspeed;


