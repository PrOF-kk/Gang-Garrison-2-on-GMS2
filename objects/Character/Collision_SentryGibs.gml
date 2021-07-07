if player.class == CLASS_ENGINEER && nutsNBolts < maxNutsNBolts {
    with other instance_destroy();
    nutsNBolts += 50;
    playsound(x,y,PickupSnd);
}

