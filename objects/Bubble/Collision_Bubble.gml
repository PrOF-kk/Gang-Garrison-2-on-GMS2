if(team == other.team)
{
    motion_add(point_direction(x, y, other.x, other.y), -0.5);
}
else
    instance_destroy();

