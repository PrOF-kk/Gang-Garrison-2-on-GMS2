if (foreground > 0)
    draw_background_ext(foreground, 0, 0 ,background_xscale[7], background_yscale[7], 0, c_white, 1);
    
// Draw map borders
draw_set_alpha(1);
draw_set_color(voidColor);

if (view_yview[0] < 0)
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0]+view_wview[0], 0, false);
if (view_yview[0]+view_hview[0] > map_height())
    draw_rectangle(view_xview[0], view_yview[0]+view_hview[0], view_xview[0]+view_wview[0], map_height(), false);
if (view_xview[0] < 0)
    draw_rectangle(view_xview[0], view_yview[0], 0, view_yview[0]+view_hview[0], false);
if (view_xview[0]+view_wview[0] > map_width())
    draw_rectangle(view_xview[0]+view_wview[0], view_yview[0], map_width(), view_yview[0]+view_hview[0], false);

