hspeed *= hfric;
rotspeed *= rotfric;

if(speed > 4 and vspeed > 2 and snd and global.run_virtual_ticks)
{
    playsound(x,y,Splat);
    repeat(9)
    if(abs(speed/bloodchance)
        * (bloodiness/maxBloodiness*0.5 + 0.5)
       > random(3))
    {
        var blood;
        blood = instance_create(x,y-1,BloodDrop);
        blood.ogib = self;
        blood.odir = point_direction(x,y,x+hspeed,y+vspeed);
        if (object_index == PumpkinGib)
            blood.sprite_index = PumpkinJuiceS;
        
        bloodiness += 1;
        
        with(blood)
        {
            motion_add(odir, ogib.speed*-0.8);
            hspeed += random(8)-3.5;
            vspeed -= random(6)-2;
        }
    }
}

really_move_contact_solid(point_direction(x,y,x+hspeed,y+vspeed), speed);

if(!place_free(x,y+sign(vspeed)))
{
    vspeed *= -0.4;
    if(!place_free(x+hspeed,y))
    {
        really_move_contact_solid(point_direction(x,y,x+hspeed,y+vspeed), speed);
        hspeed *= -0.4;
    }
}
if(!place_free(x+sign(hspeed),y))
{
    hspeed *= -0.4;
    if(!place_free(x,y+vspeed))
    {
        really_move_contact_solid(point_direction(x,y,x+hspeed,y+vspeed), speed);
        vspeed *= -0.4;
    }
}


