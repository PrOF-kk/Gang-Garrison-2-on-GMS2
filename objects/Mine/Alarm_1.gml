{
    if(animationState == 1) {
        animationState = 0;
        alarm[1]=1 / global.delta_factor;
    } else {
        animationState = 1;
        alarm[1]=29 / global.delta_factor;
    }
}
