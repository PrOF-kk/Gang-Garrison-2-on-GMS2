if (distance_to_point(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2) > 800)
    exit;
    
var imageOffset;
if ((alarm[6] <= 0 and alarm[5] <= 0) or object_index == Blade) {
    //if we are not shooting or recoiling
    imageOffset = owner.team;
} else {
    //Play the current animation normally
    var animLength;
    if (object_index != Rifle && alarm[5] <= 0)
        animLength = recoilAnimLength;
    else if (sprite_index == recoilSprite)
        animLength = recoilAnimLength;
    else
        animLength = reloadAnimLength;
        
    imageOffset = floor(image_index mod animLength) + animLength*owner.team;
}
if (!owner.invisible and !owner.taunting and !owner.omnomnomnom and !owner.player.humiliated)
{
    if (!owner.cloak)
        image_alpha = power(owner.cloakAlpha, 0.5);
    else
        image_alpha = power(owner.cloakAlpha, 2);
    draw_sprite_ext(sprite_index, imageOffset, round(x+xoffset*image_xscale), round(y+yoffset) + owner.equipmentOffset, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    if (owner.ubered)
    {
        if (owner.team == TEAM_RED)
            ubercolour = c_red;
        else if (owner.team == TEAM_BLUE)
            ubercolour = c_blue;
        draw_sprite_ext(sprite_index, imageOffset, round(x+xoffset*image_xscale), round(y+yoffset) + owner.equipmentOffset, image_xscale, image_yscale, image_angle, ubercolour, 0.7*image_alpha);
    }
}

