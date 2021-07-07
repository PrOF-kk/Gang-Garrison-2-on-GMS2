if (random(20)<2)
{
    hspeed += 1.7*other.hspeed * global.delta_factor;
    vspeed -= 1.2*other.vspeed * global.delta_factor;
    rotspeed = other.hspeed*-0.6*random(71) * global.delta_factor;
}

