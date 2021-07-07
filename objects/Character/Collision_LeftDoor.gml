//only allow passage from the left hand side, otherwise get blocked
if(hspeed < 0)
{
    var door_bbox_right;
    door_bbox_right = other.bbox_right;
    if(x+left_bound_offset-hspeed >= door_bbox_right-2)
    {
        x = door_bbox_right - left_bound_offset;
        hspeed = 0;
    }
}

