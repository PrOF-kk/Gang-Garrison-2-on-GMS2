if(global.isHost) {
    if(team == TEAM_RED and intel == true) {
        sendEventScoreIntel(player);
        doEventScoreIntel(player);
        GameServer.syncTimer = 1;
    }
}
