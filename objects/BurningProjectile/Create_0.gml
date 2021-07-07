// Child objects will need to define:
// hitDamage, flameLife, burnIncrease, durationIncrease, afterburnFalloff (bool), penetrateCap
// Then they need to call the inherited event (i.e. this code)
alarm[0] = flameLife / global.delta_factor;

enemiesHit = ds_list_create();
    
perseverant = random(1) < (1/8); // 1/8 chance


