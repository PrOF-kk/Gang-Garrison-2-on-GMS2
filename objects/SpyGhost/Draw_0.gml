if(global.hideSpyGhosts)
    instance_destroy();
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, image_angle, c_white, min(cloakAlpha, image_alpha));


