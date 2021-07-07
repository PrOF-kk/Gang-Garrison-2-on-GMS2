if(!game_init())
{
    game_end();
    exit;
}

if(BOOT_BEHAVIOUR == BOOT_DEBUG)
{
    ini_open("gg2.ini");
    global.timeLimitMins = ini_read_real("Server", "Time Limit", 15);
    global.caplimit = ini_read_real("Server", "CapLimit", 5);
    global.Server_RespawntimeSec = ini_read_real("Server", "Respawn Time", 5);
    readClasslimitsFromIni();
    ini_close();
    
    if (global.Server_RespawntimeSec == 0)
        global.Server_Respawntime = 1;
    else
        global.Server_Respawntime = global.Server_RespawntimeSec * 30;
    global.isHost = true;
    
    ds_list_clear(global.map_rotation);
    ds_list_add(global.map_rotation, "gg_debug");
    
    global.gameServer = instance_create(0,0,GameServer);    
}
else // boot behaviour is normal or unknown
{
    // Music setting set to "Menu Only" or "Menu and In-Game"
    if (global.music == MUSIC_MENU_ONLY || global.music == MUSIC_BOTH)
    {
        AudioControlPlaySong(global.FaucetMusic);
    }
}