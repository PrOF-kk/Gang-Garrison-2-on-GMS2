action_inherited();
if ammoCount < maxAmmo {
    ammoCount+=1;
}
if ammoCount < maxAmmo {
    alarm[5] = reloadTime / global.delta_factor;
    
    sprite_index = reloadSprite;
    image_index = 0;
    image_speed = reloadImageSpeed * global.delta_factor;
}

