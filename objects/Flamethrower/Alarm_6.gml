//Override this if we're airblasting
if (sprite_index != blastSprite) {
    sprite_index = dropSprite;
    image_speed = dropImageSpeed * global.delta_factor;
    image_index = 0;
    alarm[7] = dropTime / global.delta_factor;
}

