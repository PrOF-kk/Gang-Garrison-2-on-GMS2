var i, map, n1, t1, w1, n2, t2, in, str, color,yoffset;

if (global.kothHudPos)
    yoffset = 65*global.killLogPos;
else
    yoffset = 45*global.killLogPos;

draw_set_halign(fa_left);
draw_set_valign(fa_center);

for (i = 0; i < ds_list_size(kills); i += 1) {
    map = ds_list_find_value(kills, i);
    n1 = sanitiseNewlines(ds_map_find_value(map, "name1")); // Name of the Player who killed
    t1 = ds_map_find_value(map, "team1"); // Their team
    w1 = ds_map_find_value(map, "weapon"); // Their weapon sprite
    n2 = sanitiseNewlines(ds_map_find_value(map, "name2")); // Name of the Player who died
    t2 = ds_map_find_value(map, "team2"); // Their team
    in = ds_map_find_value(map, "inthis"); // Am I involved in this event?
    str = sanitiseNewlines(ds_map_find_value(map, "string")); // Special text: Finish off, bid farewell, domination, revenge
    
    draw_set_alpha(1);
    if (in)
       color = make_color_rgb(217,217,183);
    else color = make_color_rgb(49,45,26);

    draw_rectangle_color(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - string_width(string_hash_to_newline(n1 + n2 + str)) - 12 - sprite_get_width(w1), __view_get( e__VW.YView, 0 ) + i * 20 + 14 + yoffset,
        __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 8, __view_get( e__VW.YView, 0 ) + i * 20 + 24 + 8 + yoffset, color, color, color, color, 0);
    draw_rectangle_color(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - string_width(string_hash_to_newline(n1 + n2 + str)) - 14 - sprite_get_width(w1), __view_get( e__VW.YView, 0 ) + i * 20 + 16 + yoffset,
        __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 6, __view_get( e__VW.YView, 0 ) + i * 20 + 24 + 6+ yoffset, color, color, color, color, 0);
    
    if (t1 == TEAM_RED) {
        draw_set_color(make_color_rgb(171, 78, 70));
    } else if (t1 == TEAM_BLUE) {
        draw_set_color(make_color_rgb(100, 116, 132));
    } else {
        draw_set_color(c_white);
    }
    draw_text(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - string_width(string_hash_to_newline(n1 + n2 + str)) - 12 - sprite_get_width(w1), __view_get( e__VW.YView, 0 ) + i * 20 + 24 + yoffset, string_hash_to_newline(n1));
    draw_set_halign(fa_left);
    if (w1 != -1) {
        draw_sprite(w1, in, floor(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - string_width(string_hash_to_newline(n2 + str)) - 10 - sprite_get_width(w1)/2 /*- sprite_get_xoffset(w1)*/), floor(__view_get( e__VW.YView, 0 ) + i * 20 + 24 + yoffset));
    }
    
    if (in)
        draw_set_color(c_black);
    else draw_set_color(c_white);
    draw_text(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - string_width(string_hash_to_newline(n2 + str)) - 8, __view_get( e__VW.YView, 0 ) + i * 20 + 24+ yoffset, string_hash_to_newline(str));
    draw_set_halign(fa_left);
    
    if (t2 == TEAM_RED) {
        draw_set_color(make_color_rgb(171, 78, 70));
    } else if (t2 == TEAM_BLUE){
        draw_set_color(make_color_rgb(100, 116, 132));
    } else {
        draw_set_color(c_white);
    }
    draw_text(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - string_width(string_hash_to_newline(n2)) - 8, __view_get( e__VW.YView, 0 ) + i * 20 + 24 + yoffset, string_hash_to_newline(n2));
}

/* */
/*  */
