{
    if(readyToShoot and bubbleCount < maxBubbles)
    {
        var shot;
        randomize();
        shot = createShot(x+lengthdir_x(8, owner.aimDirection), y+lengthdir_y(8, owner.aimDirection), Bubble, DamageSource.BUBBLE, owner.aimDirection, 10);
        shot.gun = id;
        with(shot)
        {
            motion_add(owner.direction, owner.speed);
        }
        justShot = true;
        readyToShoot = false;
        alarm[0] = bubbleRefireTime / global.delta_factor;
        bubbleCount += 1;
    }
}

