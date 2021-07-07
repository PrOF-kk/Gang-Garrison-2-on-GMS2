if (global.particles == PARTICLES_NORMAL)
{
    var shell;
    shell = instance_create(x, y, Shell);
    shell.direction = owner.aimDirection + (140 - random(40)) * image_xscale;
    shell.image_index = 1;
}

