if (direction >= 90 and direction <= 270)
    image_xscale = -1;
else
    image_xscale = 1;

if(golden)
{
    if (team == TEAM_RED)
        sprite_index = SpyRedBackstabTorsoGoldS;
    else
        sprite_index = SpyBlueBackstabTorsoGoldS;
}
else
{
    if (team == TEAM_RED)
        sprite_index = SpyRedBackstabTorsoS;
    else
        sprite_index = SpyBlueBackstabTorsoS;
}
    
if (image_index >= 32)
{
    done = 1;
    image_speed = 0;
}

if(!done)
    if(alpha < 1)
        alpha += 0.1 * global.delta_factor;
    else
        alpha = 1;
else
{
    if(alpha > 0)
        alpha -= 0.1 * global.delta_factor;
    else
        instance_destroy();
}

