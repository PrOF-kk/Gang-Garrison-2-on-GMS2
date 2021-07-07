with (other) {
//automatically change maps if the server is empty or teams are at a standoff for too long
if (global.isHost and hostTimer > 0) { // What we're doing makes sense
    if ((!KothRedControlPoint.locked or !KothBlueControlPoint.locked)                       // Points are not both locked
        and KothRedControlPoint.team == TEAM_RED and KothBlueControlPoint.team == TEAM_BLUE // Both points are owned by their own team
        and KothBlueControlPoint.capping == 0 and KothBlueControlPoint.bluePresence == 0    // blu uncontested
        and KothRedControlPoint.capping == 0 and KothRedControlPoint.redPresence == 0)      // red uncontested
    {
        hostTimer -= 1 * global.delta_factor;
        if (hostTimer <= 0) {
            if (abs(redTimer - blueTimer) < 30*30)
                global.winners = TEAM_SPECTATOR;
            else if (redTimer < blueTimer)
                global.winners = TEAM_RED;
            else if (blueTimer < redTimer)
                global.winners = TEAM_BLUE;
        }
    }
    if (KothRedControlPoint.locked or KothBlueControlPoint.locked)
        hostTimer = global.timeLimitMins*30*60;
}
    

//both teams' countdown timers
if (!KothRedControlPoint.locked or !KothBlueControlPoint.locked)
{
    if (KothBlueControlPoint.team == TEAM_RED and redTimer >0)
        redTimer -= 1 * global.delta_factor;
    if (KothRedControlPoint.team == TEAM_BLUE and blueTimer >0)
        blueTimer -= 1 * global.delta_factor;
}
//endgame logic
if (redTimer == 0 and KothBlueControlPoint.team == TEAM_RED
    and KothBlueControlPoint.capping == 0 and KothBlueControlPoint.bluePresence == 0)
    global.winners = TEAM_RED;
if (blueTimer == 0 and KothRedControlPoint.team == TEAM_BLUE
    and KothRedControlPoint.capping == 0 and KothRedControlPoint.redPresence == 0)
    global.winners = TEAM_BLUE;

if global.isHost and KothRedControlPoint.locked and KothBlueControlPoint.locked and !global.mapchanging
{
    if (cpUnlock == 0)
    {
        sendEventUnlockCP();
        doEventUnlockCP();
    }
    else if (cpUnlock == 150)
        GameServer.syncTimer = 1;
}

if (cpUnlock > 0 and global.run_virtual_ticks)
    cpUnlock -= 1;

}
