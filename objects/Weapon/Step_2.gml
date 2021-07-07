// Ammo HUD. Because real men let computers count for them. (Rifle overrides this and doesn't create an AmmoCounter)
if(!instance_exists(AmmoCounter))
    instance_create(0,0,AmmoCounter);

if (justShot)
{
    justShot = false;
    //Recoil Animation
    if (sprite_index != recoilSprite)
    {
        sprite_index = recoilSprite;
        image_index = 0;
        image_speed = recoilImageSpeed * global.delta_factor;
    }
    alarm[6] = recoilTime / global.delta_factor;
}

