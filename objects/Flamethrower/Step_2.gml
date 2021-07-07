action_inherited();
if (justBlast)
{
    justBlast = false;
    //Airblast Recoil Animation
    sprite_index = blastSprite;
    image_index = 0;
    image_speed = blastImageSpeed * global.delta_factor;
    alarm[7] = blastNoFlameTime / global.delta_factor;
    alarm[6] = 0;
}

