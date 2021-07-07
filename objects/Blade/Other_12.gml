{
    if(readyToShoot and bladesOut < maxBlades)
    {
        replenishing = 0;
        playsound(x,y,BladeSnd);
        var shot;
        randomize();
        shot = createShot(x+lengthdir_x(5, owner.aimDirection), y+lengthdir_y(5, owner.aimDirection), BladeB, DAMAGE_SOURCE_BLADE, owner.aimDirection, 12);
        // We don't want the blade sprite to be rotated with the direction of the shot, since that would cause the hitbox to also be rotated,
        // which can cause the blade to get stuck in walls that are behind the Querly. With an angle of 0, the BladeB hitbox is exactly as wide
        // as the Querly's, so that this won't happen. See https://github.com/Gang-Garrison-2/Gang-Garrison-2/issues/230
        shot.image_angle = 0;
        if(golden)
            shot.sprite_index = BladeProjectileGoldS;
        if(ammoCount > highAmmoThreshold)
            shot.hitDamage = bladeDamage;
        else if(ammoCount < lowAmmoThreshold)
            shot.hitDamage = depletedBladeDamage;
        else
            shot.hitDamage = (ammoCount-lowAmmoThreshold)/(highAmmoThreshold-lowAmmoThreshold)*(bladeDamage-depletedBladeDamage)+depletedBladeDamage;
        alarm[0] = refireTime / global.delta_factor;
        shot.alarm[0] = bladeLife / global.delta_factor;
        alarm[5] = bladeLife / global.delta_factor; //this isn't for when the blade actually dies, but the longest it could live
        bladesOut += 1;
        with(shot)
            hspeed += owner.hspeed;
        justShot = true;
        readyToShoot = false;
    }
}

