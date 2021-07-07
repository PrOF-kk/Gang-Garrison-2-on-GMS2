    if(global.updateType == FULL_UPDATE) {
        receiveCompleteMessage(global.serverSocket,13,global.deserializeBuffer);
        stats[KILLS] = read_ubyte(global.deserializeBuffer);
        stats[DEATHS] = read_ubyte(global.deserializeBuffer);
        stats[CAPS] = read_ubyte(global.deserializeBuffer);
        stats[ASSISTS] = read_ubyte(global.deserializeBuffer);
        stats[DESTRUCTION] = read_ubyte(global.deserializeBuffer);
        stats[STABS] = read_ubyte(global.deserializeBuffer);
        stats[HEALING] = read_ushort(global.deserializeBuffer);
        stats[DEFENSES] = read_ubyte(global.deserializeBuffer);
        stats[INVULNS] = read_ubyte(global.deserializeBuffer);
        stats[BONUS] = read_ubyte(global.deserializeBuffer);
        stats[POINTS] = read_ubyte(global.deserializeBuffer);
        queueJump = read_ubyte(global.deserializeBuffer);
        parseRewards(receivestring(global.serverSocket, 2), rewards);
        parseBadges(rewards, badges);
        
        // Deserialize the domination kill table (number of kills for each player except self)
        receiveCompleteMessage(global.serverSocket, ds_list_size(global.players)-1, global.deserializeBuffer);
        var i, victim;
        for (i = 0; i < ds_list_size(global.players); i += 1)
        {
            victim = ds_list_find_value(global.players, i);
            if (victim != id)
                domination_kills_set(dominationKills, victim, read_ubyte(global.deserializeBuffer));
        }
    }
 
    var charObj, subobjects;
    receiveCompleteMessage(global.serverSocket,1,global.deserializeBuffer);
    subobjects = read_ubyte(global.deserializeBuffer);
    
    // If the player has a character object on the server
    if(subobjects & $01 != 0) {
        if(object == -1) {
            charObj = getCharacterObject(class);
            if(charObj != -1) {
                global.paramPlayer = id;
                object = instance_create(0,0,charObj);
                global.paramPlayer = noone;
            } else {
                show_message("Invalid player object while deserializing");
            }
        }
        with(object) event_user(13);
    } else {
        if(object != -1) with(object) instance_destroy();
        object = -1;
    }   
    
    // If the player has a sentry object on the server
    if(subobjects & $02)
    {
        if(!sentry)
        {
            sentry = instance_create(0,0,Sentry);
            sentry.ownerPlayer = id;
            sentry.team = team;
            sentry.startDirection = image_xscale;
            sentry.image_xscale = image_xscale;
        }
        with(sentry)
            event_user(13);
    } else {
        with(sentry)
            instance_destroy();
    }
    

