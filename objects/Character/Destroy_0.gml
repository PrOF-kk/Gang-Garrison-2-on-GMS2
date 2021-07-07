{
    loopsoundstop(UberIdleSnd);
    
    var map;
    with(currentWeapon) {
        instance_destroy();
    }
    
    with(bubble) {
        instance_destroy();
    }
    
    // Drop intel if carried. This is not done by sending an extra event because that would be a nested event, which
    // screws up order of operations (Server: do part of player death, then drop intel, then do rest of player death. Client: Do player death, drop intel for dead player, error out)
    if (intel)
    {
        doEventDropIntel(player);
        
        // lastDamageSource is not always synchronized on Character destruction (e.g. if the player just leaves), so we HAVE to sync here.
        // Let's just hope it doesn't matter whether we return the intel now (Server) or after the player destruction is finished (Client).
        if (global.isHost and (lastDamageSource == DAMAGE_SOURCE_KILL_BOX || lastDamageSource == DAMAGE_SOURCE_FRAG_BOX || lastDamageSource == DAMAGE_SOURCE_PITFALL))
        {
            var intelTeam;
            if (team == TEAM_RED)
                intelTeam = TEAM_BLUE;
            else if (team == TEAM_BLUE)
                intelTeam = TEAM_RED;
            else
                show_error("Invalid team set for Character " + player.name, true);
                
            doEventReturnIntel(intelTeam);
            sendEventReturnIntel(intelTeam);
        }
    }
    
    player.object=-1;
    if (place_meeting(x,y,SpawnRoom) or deathmatch_invulnerable != 0)
    {
        player.alarm[5] = 1;
        player.deathmatch_respawn_bypass = deathmatch_invulnerable;
    }
    else
    {
        player.alarm[5] = global.Server_Respawntime / global.delta_factor;
        player.deathmatch_respawn_bypass = 0;
    }
    
    //part type destroy
    if(variable_local_exists("jumpFlameParticleType"))
        part_type_destroy(jumpFlameParticleType);
    
    if(variable_local_exists("jumpDustParticleSystem"))
        part_type_destroy(jumpDustParticleSystem);
        
    // destroy overlay lists
    ds_list_destroy(stillOverlays);
    ds_list_destroy(leanROverlays);
    ds_list_destroy(leanLOverlays);
    ds_list_destroy(jumpOverlays);
    ds_list_destroy(runOverlays);
    ds_list_destroy(walkOverlays);
    ds_list_destroy(crouchOverlays);
    ds_list_destroy(tauntOverlays);
    ds_list_destroy(omnomnomnomOverlays);
    ds_list_destroy(gearList);
}

