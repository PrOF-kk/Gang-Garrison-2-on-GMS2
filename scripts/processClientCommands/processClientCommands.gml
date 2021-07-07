function processClientCommands(argument0, argument1) {
	var player, playerId, commandLimitRemaining;

	player = argument0;
	playerId = argument1;

	// To prevent players from flooding the server, limit the number of commands to process per step and player.
	commandLimitRemaining = 10;

	with(player) {
	    if(!variable_local_exists("commandReceiveState")) {
	        // 0: waiting for command byte.
	        // 1: waiting for command data length (1 byte)
	        // 2: waiting for command data.
	        commandReceiveState = 0;
	        commandReceiveExpectedBytes = 1;
	        commandReceiveCommand = 0;
	    }
	}

	while(commandLimitRemaining > 0) {
	    var socket;
	    socket = player.socket;
	    if(!tcp_receive(socket, player.commandReceiveExpectedBytes)) {
	        return 0;
	    }
    
	    switch(player.commandReceiveState)
	    {
	    case 0:
	        player.commandReceiveCommand = read_ubyte(socket);
	        switch(commandBytes[player.commandReceiveCommand]) {
	        case commandBytesInvalidCommand:
	            // Invalid byte received. Wait for another command byte.
	            break;
            
	        case commandBytesPrefixLength1:
	            player.commandReceiveState = 1;
	            player.commandReceiveExpectedBytes = 1;
	            break;

	        case commandBytesPrefixLength2:
	            player.commandReceiveState = 3;
	            player.commandReceiveExpectedBytes = 2;
	            break;

	        default:
	            player.commandReceiveState = 2;
	            player.commandReceiveExpectedBytes = commandBytes[player.commandReceiveCommand];
	            break;
	        }
	        break;
        
	    case 1:
	        player.commandReceiveState = 2;
	        player.commandReceiveExpectedBytes = read_ubyte(socket);
	        break;

	    case 3:
	        player.commandReceiveState = 2;
	        player.commandReceiveExpectedBytes = read_ushort(socket);
	        break;
        
	    case 2:
	        player.commandReceiveState = 0;
	        player.commandReceiveExpectedBytes = 1;
	        commandLimitRemaining -= 1;
        
	        switch(player.commandReceiveCommand)
	        {
	        case PLAYER_LEAVE:
	            socket_destroy(player.socket);
	            player.socket = -1;
	            break;
            
	        case PLAYER_CHANGECLASS:
	            var class;
	            class = read_ubyte(socket);
	            if(getCharacterObject(class) != -1)
	            {
	                if(player.object != -1)
	                {
	                    with(player.object)
	                    {
	                        if (collision_point(x,y,SpawnRoom,0,0) < 0)
	                        {
	                            if (!instance_exists(lastDamageDealer) || lastDamageDealer == player)
	                            {
	                                sendEventPlayerDeath(player, player, noone, DamageSource.BID_FAREWELL);
	                                doEventPlayerDeath(player, player, noone, DamageSource.BID_FAREWELL);
	                            }
	                            else
	                            {
	                                var assistant;
	                                assistant = secondToLastDamageDealer;
	                                if (lastDamageDealer.object)
	                                    if (lastDamageDealer.object.healer)
	                                        assistant = lastDamageDealer.object.healer;
	                                sendEventPlayerDeath(player, lastDamageDealer, assistant, DamageSource.FINISHED_OFF);
	                                doEventPlayerDeath(player, lastDamageDealer, assistant, DamageSource.FINISHED_OFF);
	                            }
	                        }
	                        else 
	                        instance_destroy(); 
                        
	                    }
	                }
	                else if(player.alarm[5]<=0)
	                    player.alarm[5] = 1; // Will spawn in the same step (between Begin Step and Step)
	                class = checkClasslimits(player, player.team, class);
	                player.class = class;
	                ServerPlayerChangeclass(playerId, player.class, global.sendBuffer);
	            }
	            break;
            
	        case PLAYER_CHANGETEAM:
	            var newTeam, balance, redSuperiority;
	            newTeam = read_ubyte(socket);
            
	            // Invalid team was requested, treat it as a random team
	            if(newTeam != TEAM_RED and newTeam != TEAM_BLUE and newTeam != TEAM_SPECTATOR)
	                newTeam = TEAM_ANY;

	            redSuperiority = 0   //calculate which team is bigger
	            with(Player)
	            {
	                if(id != player)
	                {
	                    if(team == TEAM_RED)
	                        redSuperiority += 1;
	                    else if(team == TEAM_BLUE)
	                        redSuperiority -= 1;
	                }
	            }
	            if(redSuperiority > 0)
	                balance = TEAM_RED;
	            else if(redSuperiority < 0)
	                balance = TEAM_BLUE;
	            else
	                balance = -1;
            
	            if(newTeam == TEAM_ANY)
	            {
	                if(balance == TEAM_RED)
	                    newTeam = TEAM_BLUE;
	                else if(balance == TEAM_BLUE)
	                    newTeam = TEAM_RED;
	                else
	                    newTeam = choose(TEAM_RED, TEAM_BLUE);
	            }
                
	            if(balance != newTeam and newTeam != player.team)
	            {
	                if(getCharacterObject(player.class) != -1 or newTeam==TEAM_SPECTATOR)
	                {  
	                    if(player.object != -1)
	                    {
	                        with(player.object)
	                        {
	                            if (!instance_exists(lastDamageDealer) || lastDamageDealer == player)
	                            {
	                                sendEventPlayerDeath(player, player, noone, DamageSource.BID_FAREWELL);
	                                doEventPlayerDeath(player, player, noone, DamageSource.BID_FAREWELL);
	                            }
	                            else
	                            {
	                                var assistant;
	                                assistant = secondToLastDamageDealer;
	                                if (lastDamageDealer.object)
	                                    if (lastDamageDealer.object.healer)
	                                        assistant = lastDamageDealer.object.healer;
	                                sendEventPlayerDeath(player, lastDamageDealer, assistant, DamageSource.FINISHED_OFF);
	                                doEventPlayerDeath(player, lastDamageDealer, assistant, DamageSource.FINISHED_OFF);
	                            }
	                        }
	                        player.alarm[5] = global.Server_Respawntime / global.delta_factor;
	                    }
	                    else if(player.alarm[5]<=0)
	                        player.alarm[5] = 1; // Will spawn in the same step (between Begin Step and Step)
	                    var newClass;
	                    newClass = checkClasslimits(player, newTeam, player.class);
	                    if newClass != player.class
	                    {
	                        player.class = newClass;
	                        ServerPlayerChangeclass(playerId, player.class, global.sendBuffer);
	                    }
	                    player.team = newTeam;
	                    ServerPlayerChangeteam(playerId, player.team, global.sendBuffer);
	                    clearPlayerDominations(player);
	                    ServerBalanceTeams();
	                }
	            }
	            break;                   
            
	        case CHAT_BUBBLE:
	            var bubbleImage;
	            bubbleImage = read_ubyte(socket);
	            if(global.aFirst and bubbleImage != 45)
	            {
	                bubbleImage = 61;
	            }
	            else if (bubbleImage == 61 and !global.aFirst) {
	            	// Player sent an april fools bubble on another day
	            	break;
	            }
	            write_ubyte(global.sendBuffer, CHAT_BUBBLE);
	            write_ubyte(global.sendBuffer, playerId);
	            write_ubyte(global.sendBuffer, bubbleImage);
            
	            setChatBubble(player, bubbleImage);
	            break;
            
	        case BUILD_SENTRY:
	            if(player.object != -1)
	            {
	                if(player.class == CLASS_ENGINEER
	                        and collision_circle(player.object.x, player.object.y, 50, Sentry, false, true) < 0
	                        and player.object.nutsNBolts == 100
	                        and (collision_point(player.object.x,player.object.y,SpawnRoom,0,0) < 0)
	                        and !player.sentry
	                        and !player.object.onCabinet)
	                {
	                    write_ubyte(global.sendBuffer, BUILD_SENTRY);
	                    write_ubyte(global.sendBuffer, playerId);
	                    write_ushort(global.serializeBuffer, round(player.object.x*5));
	                    write_ushort(global.serializeBuffer, round(player.object.y*5));
	                    write_byte(global.serializeBuffer, player.object.image_xscale);
	                    buildSentry(player, player.object.x, player.object.y, player.object.image_xscale);
	                }
	            }
	            break;                                       

	        case DESTROY_SENTRY:
	            with(player.sentry)
	                instance_destroy();
	            break;                     
        
	        case DROP_INTEL:
	            if (player.object != -1)
	            {
	                if (player.object.intel)
	                {
	                    sendEventDropIntel(player);
	                    doEventDropIntel(player);
	                }
	            }
	            break;     
              
	        case OMNOMNOMNOM:
	            if(player.object != -1) {
	                if(!player.humiliated
	                    and !player.object.taunting
	                    and !player.object.omnomnomnom
	                    and player.object.canEat
	                    and player.class==CLASS_HEAVY)
	                {                            
	                    write_ubyte(global.sendBuffer, OMNOMNOMNOM);
	                    write_ubyte(global.sendBuffer, playerId);
	                    with(player.object)
	                    {
	                        omnomnomnom = true;
	                        omnomnomnomindex=0;
	                        omnomnomnomend=32;
	                        xscale=image_xscale;
	                    }             
	                }
	            }
	            break;
             
	        case TOGGLE_ZOOM:
	            if player.object != -1 {
	                if player.class == CLASS_SNIPER {
	                    write_ubyte(global.sendBuffer, TOGGLE_ZOOM);
	                    write_ubyte(global.sendBuffer, playerId);
	                    toggleZoom(player.object);
	                }
	            }
	            break;
                                                      
	        case PLAYER_CHANGENAME:
	            var nameLength;
	            nameLength = socket_receivebuffer_size(socket);
	            if(nameLength > MAX_PLAYERNAME_LENGTH)
	            {
	                write_ubyte(player.socket, KICK);
	                write_ubyte(player.socket, KICK_NAME);
	                socket_destroy(player.socket);
	                player.socket = -1;
	            }
	            else
	            {
	                with(player)
	                {
	                    if(variable_local_exists("lastNamechange")) 
	                        if(current_time - lastNamechange < 1000)
	                            break;
	                    lastNamechange = current_time;
	                    name = read_string(socket, nameLength);
	                    write_ubyte(global.sendBuffer, PLAYER_CHANGENAME);
	                    write_ubyte(global.sendBuffer, playerId);
	                    write_ubyte(global.sendBuffer, string_length(name));
	                    write_string(global.sendBuffer, name);
	                }
	            }
	            break;
            
	        case INPUTSTATE:
	            if(player.object != -1)
	            {
	                with(player.object)
	                {
	                    keyState = read_ubyte(socket);
	                    netAimDirection = read_ushort(socket);
	                    aimDirection = netAimDirection*360/65536;
	                    aimDistance = read_ubyte(socket)*2;
	                    event_user(1);
	                }
	            }
	            break;
        
	        case REWARD_REQUEST:
	            player.rewardId = read_string(socket, socket_receivebuffer_size(socket));
	            player.challenge = rewardCreateChallenge();
            
	            write_ubyte(socket, REWARD_CHALLENGE_CODE);
	            write_binstring(socket, player.challenge);
	            break;
            
	        case REWARD_CHALLENGE_RESPONSE:
	            var answer, i, authbuffer;
	            answer = read_binstring(socket, 16);
            
	            with(player)
	                if(variable_local_exists("challenge") and variable_local_exists("rewardId"))
	                    rewardAuthStart(player, answer, challenge, true, rewardId);
           
	            break;

	        case PLUGIN_PACKET:
	            var packetID, buf, success;

	            packetID = read_ubyte(socket);
            
	            // get packet data
	            buf = fct_buffer_create();
	            write_buffer_part(buf, socket, socket_receivebuffer_size(socket));

	            // try to enqueue
	            success = _PluginPacketPush(packetID, buf, player);
            
	            // if it returned false, packetID was invalid
	            if (!success)
	            {
	                // clear up buffer
	                fct_buffer_destroy(buf);

	                // kick player
	                write_ubyte(player.socket, KICK);
	                write_ubyte(player.socket, KICK_BAD_PLUGIN_PACKET);
	                socket_destroy(player.socket);
	                player.socket = -1;
	            }
	            break;
            
	        case CLIENT_SETTINGS:
	            var mirror;
	            mirror = read_ubyte(player.socket);
	            player.queueJump = mirror;
            
	            write_ubyte(global.sendBuffer, CLIENT_SETTINGS);
	            write_ubyte(global.sendBuffer, playerId);
	            write_ubyte(global.sendBuffer, mirror);
	            break;
        
	        }
	        break;
	    } 
	}



}
