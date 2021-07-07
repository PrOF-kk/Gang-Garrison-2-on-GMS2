{
    hspeed /= 1.1;
    if(abs(hspeed)<0.2)
        hspeed=0;
    
    wallSetSolid();
    if(place_free(x, y+1))
    {
        vspeed += 0.6 * global.delta_factor;
        if(vspeed > 10)
            vspeed = 10;
    }
    else
    {
        vspeed = 0;
        move_outside_solid(90, 10);
    }
    wallUnsetSolid();
    
    x += hspeed * global.delta_factor;
    y += vspeed * global.delta_factor;
    x -= hspeed;
    y -= vspeed;
}

