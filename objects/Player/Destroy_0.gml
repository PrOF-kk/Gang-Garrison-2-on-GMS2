    if(object != -1) with(object) instance_destroy();
    ds_map_destroy(rewards);
    ds_list_destroy(badges);
    with (ghost)
        instance_destroy();
    socket_destroy(socket);

    clearPlayerDominations(id);
    domination_kills_destroy(dominationKills);
    
    with(Rocket) if(ownerPlayer == other.id) instance_destroy();
    with(BurningProjectile) if(ownerPlayer == other.id) instance_destroy();
    with(Shot) if(ownerPlayer == other.id) instance_destroy();
    with(Needle) if(ownerPlayer == other.id) instance_destroy();
    with(Sentry) if(ownerPlayer == other.id) instance_destroy();
    with(DeathCam) if(killedby == other.id) instance_destroy();

