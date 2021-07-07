if (distance_to_point(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2) > 800)
    exit;
    
var imageOffset;
if(shooting)
{
    shooting=false;
    imageOffset=2;
    if(instance_exists(nearestTarget))
    {
        xshootoffset=4*image_xscale;
        draw_set_alpha(0.6);
        draw_line_width_color(x+lengthdir_x(10,direction)-xshootoffset,y+lengthdir_y(10,direction)-2,nearestTarget.x+random(25)-12,nearestTarget.y+random(25)-12,2,c_yellow,c_black);
    }
}
else
    imageOffset=0;
    
if(ownerPlayer.sentry)
{
    if(ownerPlayer.sentry.image_index > 7)
    {
        if(rotating)
            draw_sprite_ext(TurretRotateS,round(rotateindex),x,y,image_xscale,image_yscale,0,c_white,1);
        else
            draw_sprite_ext(sprite_index,ownerPlayer.team + imageOffset,round(x+xoffset*image_xscale),round(y+yoffset),image_xscale,image_yscale,image_angle,c_white,1);
    }
}

