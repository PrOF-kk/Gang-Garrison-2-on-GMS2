if (global.particles == PARTICLES_NORMAL && image_alpha > 0.1)
{
    repeat(maxAmmo-ammoCount-ejected)
    {
        var shell;
        shell = instance_create(x + lengthdir_x(8, owner.aimDirection), y + lengthdir_y(8, owner.aimDirection) - 5, Shell);
        shell.direction = 180 + owner.aimDirection + (70 - random(80)) * image_xscale;
        shell.speed *= 0.7;
        ejected +=1;
    }
}

