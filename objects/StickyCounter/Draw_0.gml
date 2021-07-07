if (global.myself.team == TEAM_RED)
    image_index = 0;
else
    image_index = 1;

var xoffset, yoffset, xsize, ysize;
    
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );
draw_set_alpha(1);
draw_set_color(make_color_rgb(217, 217, 183));
draw_set_valign(fa_center);
draw_set_halign(fa_left);
    
if (global.myself.object != -1 and global.myself.class == CLASS_DEMOMAN)
{    
    draw_sprite_ext(sprite_index, image_index, xoffset+xsize-65, yoffset+ysize-78, 3, 3, 0, c_white, 1);
    if (instance_exists(global.myself.object.currentWeapon))
    {
        draw_text_transformed(xoffset+xsize-83, yoffset+ysize-76, string_hash_to_newline(global.myself.object.currentWeapon.lobbed), 1.5, 1.5, 0);
        draw_text_transformed(xoffset+xsize-70, yoffset+ysize-76, string_hash_to_newline("/8"), 1.5, 1.5, 0);
    }
}

