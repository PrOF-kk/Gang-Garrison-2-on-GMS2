{
    wallSetSolid();
    really_move_contact_solid(direction, speed);
    if(!place_free(x, y+1))
        vspeed = 0;
    wallUnsetSolid();
}

