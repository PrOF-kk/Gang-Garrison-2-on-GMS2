var xoffset, yoffset, xsize, ysize, dist;

xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );
dist = distance_to_point(xoffset+xsize/2,yoffset+ysize/2);

if (dist > 800)
    exit;
    
if (dist <= triggerDistance && fade)
    image_alpha = max(0.4*opacity, image_alpha - 0.1*global.delta_factor);
else
    image_alpha = min(opacity, image_alpha + 0.1*global.delta_factor);

if (trigger > 0)
{
    dist = distance_to_object(Character);
        
    if (triggering == 0 && dist <= triggerDistance)
        triggering = 1;
    else if (image_index >= image_number-1 && dist > triggerDistance && triggering == 1)
    {
        if (trigger == 2)
            triggering = -1;
        else {
            triggering = 0;
            image_index = 0;
        }
    }
}
    
switch(triggering)
{
    case 1:
        image_index = min(image_number-1, image_index + animationSpeed);
        break;
    case -1:
        image_index = max(0, image_index - animationSpeed);
        if (image_index == 0)
            triggering = 0;
}

    
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

