if(owner.taunting)
    exit;
    
var imageOffset, xdrawpos, ydrawpos;
imageOffset = owner.team;
xdrawpos = round(x+xoffset*image_xscale);
ydrawpos = round(y+yoffset) + owner.equipmentOffset;
if (alarm[6] <= 0){
    if (alarm[7] > 0) {
        //if we are not shooting, but airblasting/dropping
        if (sprite_index == dropSprite) {
            imageOffset = floor(image_index mod dropAnimLength) + dropAnimLength*owner.team
        }else if (sprite_index == blastSprite){
            imageOffset = floor(image_index mod blastAnimLength) + blastAnimLength*owner.team
        }
    }else{
        //set the sprite to idle
        imageOffset = owner.team;
    }
}else{
    //We are shooting, loop the shoot animation
    imageOffset = floor(image_index mod recoilAnimLength) + recoilAnimLength*owner.team
}


if !owner.player.humiliated draw_sprite_ext(sprite_index,imageOffset, xdrawpos, ydrawpos, image_xscale, image_yscale, image_angle, c_white, 1);
if (owner.ubered) {
    if owner.team == TEAM_RED
        ubercolour = c_red;
    else if owner.team == TEAM_BLUE
        ubercolour = c_blue;
    draw_sprite_ext(sprite_index,imageOffset,round(x+xoffset*image_xscale),round(y+yoffset),image_xscale,image_yscale,image_angle,ubercolour,0.7*image_alpha);
}

