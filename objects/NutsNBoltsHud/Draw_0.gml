var xoffset, yoffset, xsize, ysize;
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

if (global.myself.team == TEAM_BLUE)
    offset = 1;
else
    offset = 0;
if (global.myself.object == -1 or global.myself.class != CLASS_ENGINEER)
{
    instance_destroy();
    exit;
}
draw_set_valign(fa_center);
draw_set_halign(fa_right);
draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_ext(sprite_index,offset,xoffset+xsize-70,yoffset+ysize-85,2,2,0,c_white,1);
draw_text_transformed_color(xoffset+xsize-66,yoffset+ysize-81,string_hash_to_newline(string(floor(global.myself.object.nutsNBolts))),1.5,1.5,0,c_white,c_white,c_white,c_white,1);

