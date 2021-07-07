if(visible) {
    if(fadeout) {
        bubbleAlpha -= 0.05 * global.delta_factor;
        if(bubbleAlpha <= 0)
        {
            bubbleAlpha = 0;
            visible = false;
            fadeout = false;
        }
    }
    x = round(owner.x)+10;
    y = round(owner.y)-18;
    if(owner.stabbing)
        image_alpha = (1-((1-owner.currentWeapon.stab.alpha)*(1-owner.image_alpha)))*bubbleAlpha;
    else
        image_alpha = owner.image_alpha*bubbleAlpha;
    visible = !owner.invisible;
}

