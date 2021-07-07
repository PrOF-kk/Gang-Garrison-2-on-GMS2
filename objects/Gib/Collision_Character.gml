if((abs(other.hspeed)>3) and (random(9)<2) and (other.cloakAlpha != 0))
{
    hspeed += other.hspeed * 1.2 * global.delta_factor;
    vspeed -= 2.7 * global.delta_factor;
    rotspeed = rotspeed + other.hspeed*0.8*(random(147)-73) * global.delta_factor;
}

