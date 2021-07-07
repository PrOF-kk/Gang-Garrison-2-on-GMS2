if (global.particles == PARTICLES_NORMAL)
{
    var shell;
    shell = instance_create(x, y, Shell);
    shell.direction = owner.aimDirection + (100 + random(30)) * image_xscale;
    shell.image_index = 3 + owner.team
}

