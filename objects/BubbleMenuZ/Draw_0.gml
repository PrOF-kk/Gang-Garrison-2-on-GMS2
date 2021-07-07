if global.myself.team == TEAM_RED image_index=0;
else image_index=1;

var xoffset, yoffset, xsize, ysize;
    
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );
    
draw_set_alpha(1);
        
draw_sprite_ext(sprite_index, 0, xoffset+x, yoffset+ysize/2, 1, 1, 0, c_white, alpha);

