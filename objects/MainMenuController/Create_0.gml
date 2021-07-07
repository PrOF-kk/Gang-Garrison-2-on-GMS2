{
    global.levelchoice = 1
    menu_create(40, 300, 200, 200, 32);
    
    menu_background(208, 24, 8, 12, 4);
    
    menu_addlink("Host Game", "event_user(0);");
    menu_addlink("Join (lobby)", @"
        room_goto_fix(Lobby);
    ");
    menu_addlink("Join (manual)", @"
        global.isHost = false;
        global.serverIP = get_string("+"\""+@"Please enter the IP address or hostname of the server you want to join"+"\""+@", "+"\""+@"127.0.0.1"+"\""+@");
        global.serverPort = get_integer("+"\""+@"Please enter the port of the server you want to join"+"\""+@", 8190);
        instance_create(0,0,Client);
        Client.returnRoom = Menu;
    ");
    menu_addlink("Garrison Builder", @"
        room_goto_fix(BuilderOptions);
    ");
    menu_addlink("Options", @"
        room_goto_fix(Options);
    ");
    if (global.rewardId != "")
    {
        menu_addlink("Manage Haxxy Rewards", @"
            splash_set_main(false);
            splash_set_interrupt(false);
            splash_show_web("+"\""+@"http://www.ganggarrison.com/forums/rewards/frame.php?gg2_login=yes&reward_id="+"\""+@" + global.rewardId + "+"\""+@"&reward_key="+"\""+@" + hex(global.rewardKey), 0);
        ");
    }
    menu_addlink("Credits", @"
        room_goto_fix(Credits);
    ");
    menu_addlink("Visit The Forums",@"
        action_splash_web("+"\""+@"http://www.ganggarrison.com/forums/index.php"+"\""+@", 1)
    ");
    menu_addback("Quit", @"
        game_end();
    ");

    // Music setting set to "Menu Only" or "Menu and In-Game"
    if (!sound_isplaying(global.MenuMusic)
        && (global.music == MUSIC_MENU_ONLY || global.music == MUSIC_BOTH))
    {
        AudioControlPlaySong(global.MenuMusic);
    }

    fade = 0;
    
    // ini says we have a downloaded background
    if (global.backgroundHash != "default")
    {
        var validBackground;
        validBackground = false;

        // already loaded background in a previous instance
        if (variable_global_exists("downloadedBackground"))
        {
            menuimage = global.downloadedBackground;
            validBackground = true;
        }
        // haven't loaded yet, background exists
        else if (file_exists("background.png"))
        {
            // passes integrity check
            if (global.backgroundHash == GG2DLL_compute_MD5("background.png"))
            {
                // use downloaded background
                global.downloadedBackground = background_add("background.png", false, false);
                menuimage = global.downloadedBackground;
                validBackground = true;
            }
        }
        // otherwise, reset values
        if (!validBackground)
        {
            global.backgroundHash = "default";
            global.backgroundTitle = "";
            global.backgroundURL = "";
            global.backgroundShowVersion = true;
            ini_open("gg2.ini");
            ini_write_string("Background", "BackgroundHash", global.backgroundHash);
            ini_write_string("Background", "BackgroundTitle", global.backgroundTitle);
            ini_write_string("Background", "BackgroundURL", global.backgroundURL);
            ini_write_real("Background", "BackgroundShowVersion", global.backgroundShowVersion);
            ini_close();
        }
    }

    // use default background if ini says we should
    if (global.backgroundHash == "default")
        menuimage = global.defaultBackground;

    if(global.dedicatedMode == 1)
        event_user(0);
}

