if (global.run_virtual_ticks)
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

var redIsCapping;

if (!instance_exists(IntelligenceBlue))
    redIsCapping = true;
else if (IntelligenceBlue.alarm[0] > 0)
    redIsCapping = true;
else
    redIsCapping = false;

if (timer > 0)
    timer -= 1 * global.delta_factor;

if (global.redCaps >= global.caplimit)
    global.winners = TEAM_RED;
else if(timer <= 0 and (!redIsCapping or global.redCaps+1 < global.caplimit))
    global.winners = TEAM_BLUE;

if (timer <= 0 and global.winners == -1)
    overtime = true;


