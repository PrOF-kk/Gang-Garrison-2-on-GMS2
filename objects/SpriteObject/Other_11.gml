resource = readProperty(other.properties, "resource", STRING, "");
ds_list_add(other.specialEntities, id);

var scale;
scale = readProperty(other.properties, "scale", REAL, 1);
if (scale != 1)
{
    image_xscale = scale;
    image_yscale = scale;
}

fade = readProperty(other.properties, "fade", BOOL, fade);
animationSpeed = readProperty(other.properties, "animationspeed", REAL, animationSpeed) * global.delta_factor;
depth = readProperty(other.properties, "depth", REAL, depth);
opacity = readProperty(other.properties, "opacity", REAL, opacity);
trigger = readProperty(other.properties, "trigger", REAL, trigger);
triggerDistance = readProperty(other.properties, "distance", REAL, triggerDistance);

image_alpha = opacity;
if (trigger == 0)
    image_speed = animationSpeed;

