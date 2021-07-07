draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, min(1, fadeAlpha / 2));

if (distance_to_point(mouse_x, mouse_y) < 25)
{
    draw_set_alpha(0.5);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    if (sprite_index == GhostDeath)
        draw_set_color(c_black);
    else
        draw_set_color(c_white);
    draw_text(round(x), round(y) - 35, string_hash_to_newline("Ghost of " + sanitiseNewlines(owner.name)));
}

