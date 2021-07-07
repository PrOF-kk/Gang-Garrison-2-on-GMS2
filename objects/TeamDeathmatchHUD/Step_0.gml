if ((timer > 0) and global.run_virtual_ticks)
    timer -= 1;
if ((global.redCaps >= killLimit) or (global.blueCaps >= killLimit) or timer<=0) {
    if (global.redCaps > global.blueCaps)
        global.winners = TEAM_RED;
    else if (global.blueCaps > global.redCaps)
        global.winners = TEAM_BLUE;
    else
        global.winners = TEAM_SPECTATOR;
}

