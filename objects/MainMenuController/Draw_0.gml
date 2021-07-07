{
    draw_background(menuimage, 0, 0);

    // display background info, if downloaded
    if (global.backgroundHash != "default")
    {
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        
        // hovering over title
        if (mouse_x >= 595 - string_width(string_hash_to_newline(global.backgroundTitle))
            && mouse_x < 595
            && mouse_y >= 595 - string_height(string_hash_to_newline(global.backgroundTitle))
            && mouse_y < 595
            && global.backgroundURL != "")
        {
            draw_set_color(c_orange);
        }
        else
        {
            draw_set_color(c_white);
        }
        draw_text(595, 595, string_hash_to_newline(global.backgroundTitle));
    }

    // fade out old background
    if (fade > 0)
    {
        draw_background_ext(oldBackground, 0, 0, 1, 1, 0, c_white, fade);
    }

    if (!(global.backgroundHash != "default" && !global.backgroundShowVersion))
    {
        draw_sprite(MenuBackgroundVersionS,0,300,300);
    }
}

action_inherited();
