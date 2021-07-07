if (random(25) < 2)
{
    hspeed += 1.1*other.hspeed * global.delta_factor;
    vspeed += 0.9*other.vspeed * global.delta_factor;
    rotspeed = other.hspeed*-0.2*random(51) * global.delta_factor;
}

