if(global.winners == TEAM_RED) {
    teamoffset = 0;
} else if(global.winners == TEAM_BLUE) {
    teamoffset = 1;
} else {
    teamoffset = 2;
}

if(global.myself.team != global.winners) {
    sound=FailureSnd;
    global.myself.humiliated = 1;
} else {
    sound = VictorySnd;
}

with (Player) {
    if team == global.winners
        humiliated = 0;
    else {
        humiliated = 1;
    }
}
          
//Round end audio from spectator's perspective
if (global.myself.team == TEAM_SPECTATOR)
    if (global.winners == TEAM_SPECTATOR)
        sound = FailureSnd; //Stalemate (Everybody loses)
    else
        sound = VictorySnd; //RED/BLU Victory

if(!instance_exists(ArenaHUD)) {
    AudioControlPlaySong(sound, false);
}

