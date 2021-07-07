{
    if(!place_free(x,y))
        move_outside_solid(random(360),35);
    
    really_move_contact_solid(direction, speed);
    if(!place_free(x,y+sign(vspeed)))
    {
        vspeed = 0;
        if(!place_free(x+hspeed,y))
        {
            really_move_contact_solid(direction, speed);
            hspeed=0;
        }
    }
    if(!place_free(x+sign(hspeed),y))
    {
        hspeed = 0;
        if(!place_free(x,y+vspeed))
        {
            really_move_contact_solid(direction, speed);
            vspeed=0;
        }
    }
}

