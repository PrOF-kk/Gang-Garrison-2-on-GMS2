image_speed = 0;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

image_index += 0.5;

// for some reason this dosnt work in step
if(image_index == image_number)
    instance_destroy()

