if (timer > 0)
    timer -= 1 * global.delta_factor;

if (mode == 1 and global.run_virtual_ticks)
{
    if (global.setupTimer > 0)
        global.setupTimer -= 1;
    if (global.setupTimer == 90 or global.setupTimer == 120
        or global.setupTimer == 150 or global.setupTimer == 180)
        sound_play(CountDown1Snd);
    else if (global.setupTimer == 60)
        sound_play(CountDown2Snd);
    else if (global.setupTimer == 30)
    {
        timer = timeLimit;
        sound_play(SirenSnd);
    }
}


//overtime?
overtime = 0;
if (timer == 0)
{
    for (i=1; i<= global.totalControlPoints; i+=1)
    {
        if (global.cp[i].capping > 0)
            overtime = 1;
    }
}

//check for winner
//mode 0 traditional, mode 1 attack/defend

if (mode == 0)
{
    if (global.cp[1].team == global.cp[global.totalControlPoints].team)
    {
        if (global.cp[1].team == TEAM_RED)
            global.winners = TEAM_RED;
        else if (global.cp[1].team == TEAM_BLUE)
            global.winners = TEAM_BLUE;
    }
    else if (timer == 0 and overtime == 0)
    {
        global.winners = TEAM_SPECTATOR;
    }
}
    
else if (mode == 1)
{
    if (global.cp[global.totalControlPoints].team == TEAM_RED)
    {
        global.winners = TEAM_RED;
    }
    else if (timer == 0 and overtime == 0)
    {
        global.winners = TEAM_BLUE;
    }
    
    // prevent timer overflow
    // credits go to nagn
    // limit time to 5 minute as heenok suggests
    if (timer > 9000)
    {
        timer = 9000;
        GameServer.syncTimer = 1;
    }
}

