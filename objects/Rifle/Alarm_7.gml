if (global.particles == PARTICLES_NORMAL)
{
    var shell;
    shell = instance_create(x, y, Shell);
    shell.direction = owner.aimDirection + (100 + random(30)) * image_xscale;
    shell.hspeed -= 1 * image_xscale;
    shell.vspeed -= 1;
    shell.image_index = 2;
}

