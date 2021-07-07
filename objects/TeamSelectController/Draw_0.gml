if instance_exists(DeathCam) exit;
if global.myself != -1 {
    if global.myself.team == TEAM_RED image_index=0;
    else image_index=1;
}

var xoffset, yoffset, xsize, ysize;
    
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );
  
draw_set_alpha(1);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
    
if alpha < 0.8 draw_set_alpha(alpha);
else draw_set_alpha(0.8);
draw_rectangle_color(xoffset,yoffset,xoffset+xsize,yoffset+ysize,c_black,c_black,c_black,c_black,0);

draw_sprite_ext(TeamSelectBS, 0, xoffset+800, yoffset+y, max(0, xsize-800), 1, 0, c_white, alpha);
draw_sprite_ext(sprite_index, image_index, xoffset+400, yoffset+y, 1, 1, 0, c_white, alpha);

if(newteam != -1 && y==120)
{
    if(door != -1 && door != 3 && door != 4)
    {
        draw_sprite_ext(TeamDoorS,door,xoffset+drawx,yoffset+48,1,1,0,c_white, 1);
        draw_sprite_ext(DoorTopLightUpS,door,xoffset+drawx+16,yoffset,1,1,0,c_white, 1);
    }
    
    if(newteam == TEAM_SPECTATOR)
        draw_sprite_ext(TVLightUpS,0,xoffset+drawx,yoffset+118,1,1,0,c_white, 1);
        
    draw_set_color(c_white);
    draw_text(xoffset+495,yoffset+80,string_hash_to_newline(text[0]));
    draw_text(xoffset+495,yoffset+100,string_hash_to_newline(text[1]));
    draw_text(xoffset+495,yoffset+120,string_hash_to_newline(text[2]));
    draw_text(xoffset+495,yoffset+130,string_hash_to_newline(text[3]));
    draw_text(xoffset+495,yoffset+140,string_hash_to_newline(text[4]));
}
else
{ 
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(xoffset+625,yoffset+y,string_hash_to_newline(global.currentMap));
}
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(xoffset+284,yoffset+y-94,string_hash_to_newline(redteam));
draw_text(xoffset+396,yoffset+y-94,string_hash_to_newline(blueteam));

