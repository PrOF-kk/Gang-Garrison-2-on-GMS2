if(abs(hspeed)<0.2)
{
    hspeed=0;
}

sprite_set_offset(mask_index, sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index));

wallSetSolid();
if(place_free(x,y+1))
{
    vspeed += 0.6 * global.delta_factor;
    if(vspeed>10)
    {
        vspeed=10;
    }
    hitground = false;
}
else
{
    if (!hitground)
    {
        if (vspeed >= 1.2)
           playsound(x,y,ImpactSnd);
        hitground = true;
    }
    vspeed = 0;
    hspeed /= power(1.1, global.delta_factor);
}

if(!place_free(x+hspeed, y+vspeed))
    event_user(0);
    
if (hitground == true and hasMoney == true)
{
    instance_create(x,y,Money);
    hasMoney = false;
}
wallUnsetSolid();

x += hspeed * global.delta_factor;
y += vspeed * global.delta_factor;
x -= hspeed;
y -= vspeed;


