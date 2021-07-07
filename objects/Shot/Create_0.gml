{
    hitDamage = 8;
    lifetime = 40;
    alarm[0] = lifetime / global.delta_factor;
    originx = x;
    originy = y;
    
    // Controls whether this bullet penetrates bubbles or not
    // Also controls whether this bullet destroys friendly bubbles
    perseverant = choose(0, 0, 1); // 1/3 chance
}

