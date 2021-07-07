if(!burning
    and sprite_index != SheetFallingGold1
    and sprite_index != SheetFallingGold2
    and sprite_index != SheetFallingGold3)
{
    sprite_index = SheetBurning;
    burning = true;
    image_index = 0;
    image_speed = global.delta_factor / 4;
    alarm[1] = 24 / global.delta_factor;
}

