    if((not done) and (global.myself.team != team))
    {
        ClientPlayerChangeteam(team, global.serverSocket);
        socket_send(global.serverSocket);
    }
    done = true;
    if team == TEAM_SPECTATOR{
        if instance_exists(Spectator) with(Spectator) instance_destroy();
        instance_create(map_width()/2,map_height()/2,Spectator);
    }

    if (global.startedGame == true) 
    {
        alarm[1] = 5 / global.delta_factor;
    }
    

