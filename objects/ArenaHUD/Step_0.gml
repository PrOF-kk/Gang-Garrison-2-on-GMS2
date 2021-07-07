redteam = 0;
blueteam = 0;
redteamCharacters = 0;
blueteamCharacters = 0;

for(i = 0; i < ds_list_size(global.players); i += 1)
{
    player = ds_list_find_value(global.players, i);
    if(player.team == TEAM_RED)
    {
        redteam += 1;
        if (player.object != -1 or alarm[5] != -1)
            redteamCharacters += 1;
    }
    else if (player.team == TEAM_BLUE)
    {
        blueteam += 1;
        if (player.object != -1 or alarm[5] != -1)
            blueteamCharacters += 1;    
    }
}

if (global.run_virtual_ticks)
{
    if(state != ARENA_STATE_ROUND_SETUP and cpUnlock > 0)
    {
        cpUnlock -= 1;
        
        if (global.isHost)
        {
            if (cpUnlock <= 0)
            {
                sendEventUnlockCP();
                doEventUnlockCP();
            }
            else if (cpUnlock == 150)
                GameServer.syncTimer = 1;
        }
    }
    
    if(state == ARENA_STATE_ROUND_SETUP and roundStart > 0)
        roundStart -= 1;
    
    if(state == ARENA_STATE_ROUND_END and endCount > 0)
        endCount -= 1;
        
    if (timer > 0)
        timer -= 1;
    
    if ((state == ARENA_STATE_ROUND_SETUP or state == ARENA_STATE_ROUND_PROPER) and timer <= 0)
        overtime = 1;
    
    if (global.isHost)
    {
        if(global.winners != -1)
        {
            // Essentially an extra "end of map" state
        }
        if(state == ARENA_STATE_WAITING)
        {
            if(timer <= 0)
                global.winners = TEAM_SPECTATOR;
            else if(redteam >= 1 and blueteam >= 1)
                serverArenaRestart();
        }
        else if (state == ARENA_STATE_ROUND_SETUP)
        {
            if (roundStart <= 0)
            {
                sendEventArenaStartRound();
                doEventArenaStartRound();
            }
        }
        else if (state == ARENA_STATE_ROUND_PROPER)
        {
            var win;
            win = -1;
            if (ArenaControlPoint.team != -1)
                win = ArenaControlPoint.team;
            else if (blueteamCharacters == 0)
                win = TEAM_RED;
            else if (redteamCharacters == 0)
                win = TEAM_BLUE;
                
            if(win != -1)
                serverArenaEndRound(win);
        }
        else if (state == ARENA_STATE_ROUND_END)
        {
            if (endCount <= 0)
            {
                if (redWins >= global.caplimit)
                    global.winners = TEAM_RED;
                else if (blueWins >= global.caplimit)
                    global.winners = TEAM_BLUE;
                else if (timer <= 0)
                    global.winners = TEAM_SPECTATOR;
                else if (redteam == 0 or blueteam == 0)
                {
                    sendEventArenaWaitForPlayers();
                    doEventArenaWaitForPlayers();
                }
                else
                    serverArenaRestart();
            }
        }
    }
}

