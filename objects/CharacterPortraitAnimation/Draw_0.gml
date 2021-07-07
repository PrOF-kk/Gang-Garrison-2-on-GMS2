xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

draw_sprite_ext(sprite_index,image_index+(global.myself.team)*(image_number*0.5),xoffset+230,yoffset+128,4,4,0,c_white, image_alpha);

