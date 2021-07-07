{
    hitDamage = 25;
    explosionDamage = 30;
    blastRadius = 65;
    characterHit = -1;
    exploded = false;
    knockback = 8;
    bubbled = false;
    explodeImmediately = false;
    
    fade = false;
    distanceToTravel = 800;
    playersPassed = ds_list_create();
    
    alarm[1] = 20 / global.delta_factor;
    alarm[2] = 30 / global.delta_factor;
}

