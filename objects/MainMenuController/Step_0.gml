action_inherited();
fade -= 1/90 * global.delta_factor;
if (fade < 0)
{
    fade = 0;
}

if (global.backgroundHash != "default")
{
    // hovering over title
    if (mouse_x >= 595 - string_width(string_hash_to_newline(global.backgroundTitle))
        && mouse_x < 595
        && mouse_y >= 595 - string_height(string_hash_to_newline(global.backgroundTitle))
        && mouse_y < 595
        && global.backgroundURL != "")
    {
        // clicking
        if (mouse_check_button_pressed(mb_left))
        {
            mouse_clear(mb_left);
            action_splash_web(global.backgroundURL, 1);
        }
    }
}

