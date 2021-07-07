if (justShot)
{
    justShot = false;
    //Recoil Animation
    if (owner.zoomed)
    {
        if (sprite_index != reloadSprite)
        {
            sprite_index = reloadSprite
            image_index = 0
            image_speed = reloadImageSpeed;
        }
        alarm[6] = longRecoilTime;
    }
    else
    {
        if (sprite_index != recoilSprite)
        {
            sprite_index = recoilSprite
            image_index = 0
            image_speed = recoilImageSpeed;
        }
        alarm[6] = recoilTime;
    }
}

