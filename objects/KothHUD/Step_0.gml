//automatically change maps if the server is empty for too long
if (global.isHost and hostTimer > 0 // What we're doing makes sense
    and !KothControlPoint.locked and KothControlPoint.team != -1    // Not pregame
    and KothControlPoint.capping == 0 and KothControlPoint.bluePresence == 0 and KothControlPoint.redPresence == 0) // Nobody capping
{
    hostTimer -= 1 * global.delta_factor;
    if (hostTimer == 0)
        global.winners = TEAM_SPECTATOR;
}
//both teams' countdown timers
if (!KothControlPoint.locked)
{
    if (KothControlPoint.team == TEAM_RED and redTimer > 0)
        redTimer -= 1 * global.delta_factor;
    if (KothControlPoint.team == TEAM_BLUE and blueTimer > 0)
        blueTimer -= 1 * global.delta_factor;
}
//endgame logic
if (redTimer == 0 and KothControlPoint.team == TEAM_RED and KothControlPoint.capping == 0 and KothControlPoint.bluePresence == 0)
    global.winners = TEAM_RED;
if (blueTimer == 0 and KothControlPoint.team == TEAM_BLUE and KothControlPoint.capping == 0 and KothControlPoint.redPresence == 0)
    global.winners = TEAM_BLUE;
if global.isHost and KothControlPoint.locked and !global.mapchanging {
    if (cpUnlock == 0)
    {
        sendEventUnlockCP();
        doEventUnlockCP();
    }
    else if (cpUnlock == 150)
    {
        GameServer.syncTimer = 1;
    }
}
if (cpUnlock > 0)
    cpUnlock -= 1 * global.delta_factor;


