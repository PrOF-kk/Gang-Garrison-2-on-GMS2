var xoffset, yoffset, xsize, ysize;
    
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

if instance_exists(ScoreTableController)
    image_alpha = ScoreTableController.alpha;
else
    image_alpha = 0;
draw_sprite_ext(sprite_index, teamoffset, xoffset+xsize/2, yoffset+600/9, 1, 1, 0, c_white, image_alpha*0.8);

draw_set_color(c_black);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

