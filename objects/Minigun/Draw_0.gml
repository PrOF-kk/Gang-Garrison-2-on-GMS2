if(owner.taunting or owner.omnomnomnom or owner.player.humiliated)
    exit;
var imageOffset, xdrawpos, ydrawpos;
imageOffset = owner.team;
xdrawpos = round(x+xoffset*image_xscale);
ydrawpos = round(y+yoffset);
if (alarm[6] <= 0){
    //set the sprite to idle
    imageOffset = owner.team;
}else{
    //We are shooting, loop the shoot animation
    imageOffset = floor(image_index mod recoilAnimLength) + recoilAnimLength*owner.team
}
    draw_sprite_ext(sprite_index,imageOffset,round(x+xoffset*image_xscale),round(y+yoffset),image_xscale,image_yscale,image_angle,c_white,image_alpha);
    /*if (sprite_index == normalSprite) {
         draw_sprite_ext(overlaySprite,imageOffset, xdrawpos, ydrawpos, image_xscale, image_yscale, image_angle, c_red,0.5*(1-(ammoCount/maxAmmo)));
    }else if (sprite_index == recoilSprite) {
        draw_sprite_ext(overlayFiringSprite,imageOffset, xdrawpos, ydrawpos, image_xscale, image_yscale, image_angle, c_red,0.5*(1-(ammoCount/maxAmmo)));
    }*/
    // ^- I'm leaving this note here for NAGN in case he doesn't learn that i undid this, we need to have a forum debate about whether you should show the overheat to both teams before we put it in the game
if (owner.ubered) {
    if owner.team == TEAM_RED
        ubercolour = c_red;
    else if owner.team == TEAM_BLUE
        ubercolour = c_blue;
    draw_sprite_ext(sprite_index,imageOffset,round(x+xoffset*image_xscale),round(y+yoffset),image_xscale,image_yscale,image_angle,ubercolour,0.7*image_alpha);
}

/* */
/*  */
