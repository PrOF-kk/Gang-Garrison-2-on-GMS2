//only allow passage from the right hand side, otherwise get blocked
if(hspeed > 0)
{   
    if (x+right_bound_offset - hspeed <= other.bbox_left + 2)
    {
        x = other.x - right_bound_offset;
        hspeed = 0;
    }
}

