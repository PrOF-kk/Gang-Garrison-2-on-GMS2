{
    alarm[1] = 2 / global.delta_factor;
    image_xscale=1;
    image_yscale=1;
    image_alpha=0.5;
    repeat(7)
    {
        if(random(8)>4)
        { 
            var blood;
            blood = instance_create(x,y,BloodDrop);
            blood.speed = random(12);
            blood.direction = direction+random(43)-22;
            blood.lifetime = 60+random(51)-25;
        }
    }
}

