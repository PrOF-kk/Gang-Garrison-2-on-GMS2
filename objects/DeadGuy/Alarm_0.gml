{
    alarm[0]=1;
    image_alpha -= 1/90 * global.delta_factor;
    if(image_alpha <= 0) {
        instance_destroy();
    }
}
