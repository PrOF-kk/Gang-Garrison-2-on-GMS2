action_inherited();
if ammoCount < maxAmmo {
    ammoCount += 1;
    
    if (global.particles == PARTICLES_NORMAL)
    {
        var shell;
        shell = instance_create(x, y, Shell);
        shell.direction = owner.aimDirection + (140 - random(40)) * image_xscale;
        shell.image_index = 1;
    }
}
if ammoCount < maxAmmo {
    alarm[5] = reloadTime / global.delta_factor;
    sprite_index = reloadSprite;
    image_index = 0;
    image_speed = reloadImageSpeed * global.delta_factor;
}

