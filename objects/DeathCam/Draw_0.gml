    xoffset = __view_get( e__VW.XView, 0 );
    yoffset = __view_get( e__VW.YView, 0 );
    xsize = __view_get( e__VW.WView, 0 );
    ysize = __view_get( e__VW.HView, 0 );
    
if DeathCamS==-1 exit;

if zooming==true{
    if zoom < 2 zoom += 0.1 * global.delta_factor;
}
draw_sprite_ext(DeathCamS,0,__view_get( e__VW.XView, 0 )+400,__view_get( e__VW.YView, 0 )+300,zoom,zoom,0,c_white,1);
draw_rectangle_color(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+xsize,__view_get( e__VW.YView, 0 )+100,c_black,c_black,c_black,c_black,0);
draw_rectangle_color(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+ysize-100,__view_get( e__VW.XView, 0 )+xsize,__view_get( e__VW.YView, 0 )+ysize,c_black,c_black,c_black,c_black,0);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if team == TEAM_RED draw_set_color(c_blue);
else draw_set_color(c_red);


draw_text_transformed(__view_get( e__VW.XView, 0 )+xsize/2,__view_get( e__VW.YView, 0 )+30, string_hash_to_newline(killmessage),2,2,0);
draw_text_transformed(__view_get( e__VW.XView, 0 )+xsize/2,__view_get( e__VW.YView, 0 )+60, string_hash_to_newline(sanitiseNewlines(name)),2,2,0);
if maxHp != 0 {
    if killedby.object!=-1  {
        draw_healthbar(xoffset+xsize/2-18, yoffset+ysize-50-18, xoffset+xsize/2+18, yoffset+ysize-50+18, hp*100/maxHp,c_black,c_red,c_green,3,true,false);
        draw_sprite_ext(DeathCamHealthBarS,0,xoffset+xsize/2, yoffset+ysize-50,2,2,0,c_white,1);
    }
}

