if(place_free(x,y+1)) {    
    hspeed /= delta_mult(4/3);
    hspeed += (random(vspeed*4)-vspeed*2) * global.delta_factor;
    
    if( sprite_index != SheetFallingGold1
    and sprite_index != SheetFallingGold2
    and sprite_index != SheetFallingGold3)
    {
        vspeed += random(0.2) * global.delta_factor;
        vspeed /= delta_mult(4/3);
    }
    // make gold trails heavier
    else
    {
        vspeed += random(0.4) * global.delta_factor;
        vspeed /= delta_mult(8/7);
    }
}

if(!burning)
    image_speed = vspeed * global.delta_factor;
else
    vspeed -= 0.2 * global.delta_factor;


if( sprite_index == SheetFallingGold1
 or sprite_index == SheetFallingGold2
 or sprite_index == SheetFallingGold3)
{
    image_speed /= 4;
}

if(fadeout) {
    image_alpha -= (1/30) * global.delta_factor;
}

x -= hspeed;
y -= vspeed;
x += hspeed * global.delta_factor;
y += vspeed * global.delta_factor;


