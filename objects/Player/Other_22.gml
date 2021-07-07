var subobjects;

    if(global.updateType == FULL_UPDATE) {
        write_ubyte(global.serializeBuffer, stats[KILLS]);
        write_ubyte(global.serializeBuffer, stats[DEATHS]);
        write_ubyte(global.serializeBuffer, stats[CAPS]);
        write_ubyte(global.serializeBuffer, stats[ASSISTS]);
        write_ubyte(global.serializeBuffer, stats[DESTRUCTION]);
        write_ubyte(global.serializeBuffer, stats[STABS]);
        write_ushort(global.serializeBuffer, stats[HEALING]);
        write_ubyte(global.serializeBuffer, stats[DEFENSES]);
        write_ubyte(global.serializeBuffer, stats[INVULNS]);
        write_ubyte(global.serializeBuffer, stats[BONUS]);
        write_ubyte(global.serializeBuffer, stats[POINTS]);
        write_ubyte(global.serializeBuffer, queueJump);
        var unparsed;
        unparsed = unparseRewards(rewards);
        write_ushort(global.serializeBuffer, string_length(unparsed));
        write_string(global.serializeBuffer, unparsed);
        
        // Serialize the domination kill table by sending the number of kills for each
        // player except self
        var i, victim;
        for (i = 0; i < ds_list_size(global.players); i += 1)
        {
            victim = ds_list_find_value(global.players, i);
            if (victim != id)
                write_ubyte(global.serializeBuffer, domination_kills_get(dominationKills, victim));
        }
    } 
    
    subobjects=0;
    
    if(object != -1) subobjects |= $01;
    if(sentry) subobjects |= $02;
    
    write_ubyte(global.serializeBuffer, subobjects);

    if(object != -1) with(object) event_user(12);     
    with(sentry)
        event_user(12);

