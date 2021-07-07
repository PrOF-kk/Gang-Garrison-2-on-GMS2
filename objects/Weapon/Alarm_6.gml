if (reloadSprite != -1 && object_index != Rifle && alarm[5] > 0)
{
    sprite_index = reloadSprite;
    image_index = 0;
    image_speed = reloadImageSpeed * global.delta_factor;
} 
else
{
    sprite_index = normalSprite;
    image_speed = 0;
}

