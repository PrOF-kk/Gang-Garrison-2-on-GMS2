wallSetSolid();
if(place_meeting(x, y, Obstacle))
{
    move_outside_solid(direction-180, speed);
}
if(place_meeting(x + hspeed, y + vspeed, Obstacle) and !place_meeting(x + hspeed, y + vspeed + 6, Obstacle))
{
    y += 6;
}
else if(place_meeting(x + hspeed, y + vspeed, Obstacle) and !place_meeting(x + hspeed, y + vspeed - 6, Obstacle))
{
    y -= 6;
}

if(place_meeting(x + hspeed, y, Obstacle))
{
    hspeed = 0;
}
if(place_meeting(x, y + vspeed, Obstacle))
{
    vspeed = 0;
}
if(place_meeting(x + hspeed, y + vspeed, Obstacle))
{
    speed = 0;
}
wallUnsetSolid();

