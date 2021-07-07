height = string_height_ext(string_hash_to_newline(msg), -1, width);

if (updating)
{
    button_x1 = x - button_padding;
    button_y1 = y + button_padding;
    button_x2 = x + width + button_padding;
    button_y2 = y + button_padding + (button_padding + string_height(string_hash_to_newline(button_label)) + button_padding);
}

draw_set_color(c_black);
draw_set_alpha(0.35);
draw_rectangle(x - 5, y - height - 5, x + width + 5, y + 5, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(x, y - height, string_hash_to_newline(msg), -1, width);

if (updating)
{
    if (button_x1 <= mouse_x && mouse_x <= button_x2 && button_y1 <= mouse_y && mouse_y <= button_y2)
    {
        draw_set_alpha(0.71);
    }
    else
    {
        draw_set_alpha(0.6);
    }
    draw_set_color(c_black);
    draw_rectangle(button_x1, button_y1+1, button_x2, button_y2, false);
    
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(floor(x + width / 2),
              floor(y + button_padding + (button_padding + string_height(string_hash_to_newline("Update")) + button_padding) / 2),
              string_hash_to_newline(button_label));
}

