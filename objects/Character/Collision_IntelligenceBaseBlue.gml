if(global.isHost) {
    if(team == TEAM_BLUE and intel == true) {
        sendEventScoreIntel(player);
        doEventScoreIntel(player);
        GameServer.syncTimer = 1;
    }
}
