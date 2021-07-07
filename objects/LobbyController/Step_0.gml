{
    var size, namelength, server;
    
    if(lobbysocket != -1) {
        if(socket_has_error(lobbysocket)) {
            if(numServers == -1) {
                show_message("Connecting to the lobby server has failed. Reason:#" + socket_error(lobbysocket));
            }
            socket_destroy(lobbysocket);
            lobbysocket = -1;
        } else if(numServers == -1) {
            if(tcp_receive(lobbysocket, 4)) {
                numServers = read_uint(lobbysocket);
            }
        } else if(serversRead < numServers) {
            if(serverInfoLength == -1) {
                if(tcp_receive(lobbysocket, 4)) {
                    serverInfoLength = read_uint(lobbysocket);
                    if(serverInfoLength>100000)
                    {
                        show_message("Server data block from lobby is too large ("+string(serverInfoLength)+")");
                        serverInfoLength = -1;
                        socket_destroy(lobbysocket);
                        lobbysocket = -1;
                    }
                }
            }
            if(serverInfoLength != -1)
            {
                if(tcp_receive(lobbysocket, serverInfoLength))
                {
                    var infolen, playercount, sameProtocolId;
                    sameProtocolId = false;
                    server = instance_create(0,0,Server);
                    server.protocol = read_ubyte(lobbysocket);
                    server.port = read_ushort(lobbysocket);
                    server.ip = string(read_ubyte(lobbysocket))+"."+string(read_ubyte(lobbysocket))+"."+string(read_ubyte(lobbysocket))+"."+string(read_ubyte(lobbysocket));
                    read_string(lobbysocket, 2+16);
                    server.slots = read_ushort(lobbysocket);
                    server.players = read_ushort(lobbysocket);
                    server.bots = read_ushort(lobbysocket);
                    server.private = ((read_ushort(lobbysocket)&1) != 0);
                    infolen = read_ushort(lobbysocket);
                    repeat(infolen)
                    {
                        var key, val;
                        key = read_string(lobbysocket, read_ubyte(lobbysocket));
                        if(key=="protocol_id")
                        {
                            fct_buffer_set_readpos(global.protocolUuid, 0);
                            sameProtocolId = true;
                            repeat(read_ushort(lobbysocket))
                                if(read_ubyte(global.protocolUuid) != read_ubyte(lobbysocket))
                                    sameProtocolId = false;
                        }
                        else
                        {
                            val = read_string(lobbysocket, read_ushort(lobbysocket));
                            ds_map_add(server.infos, key, val);
                        }
                    }
                    server.compatible = (server.protocol==0 and server.port>0 and sameProtocolId);
                    if(server.bots)
                        playercount = string(server.players) + "+" + string(server.bots);
                    else 
                        playercount = string(server.players);
                    server.playerstring =  playercount + "/" + string(server.slots);
                    
                    server.shortgame = "";
                    if(ds_map_exists(server.infos, "game_short"))
                        server.shortgame = ds_map_find_value(server.infos, "game_short");
                    else if(ds_map_exists(server.infos, "game"))
                        server.shortgame = ds_map_find_value(server.infos, "game");
                    if(server.shortgame != "")
                    {
                        if(ds_map_exists(server.infos, "game_ver"))
                            server.shortgame += " " + ds_map_find_value(server.infos, "game_ver");
                    }
                    server.name = ds_map_find_value(server.infos, "name");
                    serversRead += 1;
                    serverInfoLength = -1;
                }
            }
        } else {
            socket_destroy(lobbysocket);
            lobbysocket = -1;
        }                    
    }
    
    if(mouse_x > xbegin and mouse_x < xbegin+width) {
        virtualitem = round((mouse_y-ybegin+12)/spacing-0.5);
        if(virtualitem<0 or virtualitem>items) {
            virtualitem = -1;
        } else {
            virtualitem += offset;
        }
        if(mouse_check_button_pressed(mb_left) and virtualitem<ds_list_size(servers) and virtualitem>=0){
            server = ds_list_find_value(servers, virtualitem);
            if(server.compatible)
            {            
                global.isHost = false;
                global.serverIP = server.ip;
                global.serverPort = server.port;
                if(instance_exists(Client))
                {   // We can't _actually_ destroy and recreate the Client here, because destroying it will cause a room change and that will cause the Create event not to run... Yay, GM!
                    with(Client)
                    {
                        event_perform(ev_destroy,0);
                        ClientCreate();
                    }
                }
                else
                {
                    instance_create(0,0,Client);
                }
                Client.returnRoom = Lobby;
            }
            else
            {
                var question;
                question = "The selected game is not compatible with this client.##";
                question += "Server: " + sanitiseNewlines(ds_map_find_value(server.infos, "name")) + "#";
                if(ds_map_exists(server.infos, "game"))
                    question += "Game/Mod: " + sanitiseNewlines(ds_map_find_value(server.infos, "game")) + "#";
                if(ds_map_exists(server.infos, "game_ver"))
                    question += "Version: " + sanitiseNewlines(ds_map_find_value(server.infos, "game_ver")) + "#";
                if(ds_map_exists(server.infos, "game_url"))
                {
                    var gameurl, reallyvisit;
                    gameurl = sanitiseNewlines(ds_map_find_value(server.infos, "game_url"));
                    question += "Website: " + gameurl + "##Do you want to visit this website now?";
                    if(show_question(question))
                        if(show_question("Warning: The website link is provided by the game server you selected and could lead anywhere.#Really visit '"+gameurl+"'?"))
                            action_splash_web(ds_map_find_value(server.infos, "game_url"), 1);
                }
                else
                {
                    show_message(question);
                }
            }
        }
    } else {
        virtualitem = -1;
    }
}

