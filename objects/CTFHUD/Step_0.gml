var redIsCapping, blueIsCapping;

redIsCapping = !instance_exists(IntelligenceBlue);
blueIsCapping = !instance_exists(IntelligenceRed);
if (!redIsCapping)
    redIsCapping = (IntelligenceBlue.x != IntelligenceBaseBlue.x or IntelligenceBlue.y != IntelligenceBaseBlue.y);
if (!blueIsCapping)
    blueIsCapping = (IntelligenceRed.x != IntelligenceBaseRed.x or IntelligenceRed.y != IntelligenceBaseRed.y);

if (timer > 0)
    timer -= 1 * global.delta_factor;
if ((global.redCaps >= global.caplimit) or (global.blueCaps >= global.caplimit) or timer<=0) {
    if (global.redCaps > global.blueCaps)
        global.winners = TEAM_RED;
    else if (global.blueCaps > global.redCaps)
        global.winners = TEAM_BLUE;
    else if (!redIsCapping and !blueIsCapping and global.blueCaps == global.redCaps)
        global.winners = TEAM_SPECTATOR;
}
    
if (timer <= 0 and global.winners == -1)
    overtime = true;

