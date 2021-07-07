action_inherited();
resource = readProperty(other.properties, "resource", STRING, "");
ds_list_add(other.specialEntities, id);

var scale;
scale = readProperty(other.properties, "scale", REAL, 1);
if (scale != 1)
{
    image_xscale = scale;
    image_yscale = scale;
}

animationSpeed = readProperty(other.properties, "animationspeed", REAL, animationSpeed);
trigger = readProperty(other.properties, "trigger", REAL, trigger);
if(trigger != 0)
    movementState = 0;
else
    movementState = 1;

top = readProperty(other.properties, "top", REAL, top);
left = readProperty(other.properties, "left", REAL, left);
upSpeed = readProperty(other.properties, "upspeed", REAL, upSpeed);
downSpeed = readProperty(other.properties, "downspeed", REAL, downSpeed);

