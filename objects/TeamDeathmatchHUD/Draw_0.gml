var xoffset, yoffset, xsize, ysize, xshift, yshift;
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );
xshift = -320 * global.timerPos;
yshift = 5 * global.timerPos;

var width, height, xpos, ypos;
width = sprite_get_width(sprite_index) * 3;
height = sprite_get_height(sprite_index) * 3;
xpos = xoffset + xsize / 2 - width / 2;
ypos = yoffset + ysize;

draw_set_alpha(1);
   
draw_sprite_ext(sprite_index, 0, xpos, ypos, 3, 3, 0, c_white, 1);

draw_set_color(c_black);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

// Red kills
draw_text_transformed(xpos + width / 2 - width / 3.5, ypos - height / 2 + 6, string_hash_to_newline(string(global.redCaps)), 2, 2, 0);

// Blue kills
draw_text_transformed(xpos + width / 2 + width / 3.5, ypos - height / 2 + 6, string_hash_to_newline(string(global.blueCaps)), 2, 2, 0);

// Kill limit
draw_text_transformed(xpos + width / 2, ypos - 14, string_hash_to_newline(string(killLimit)), 2, 2, 0);

//timer
if instance_exists(WinBanner) exit;
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_roundtimer(xoffset, yoffset, xsize, ysize, timer);


