{
    cursor_sprite = CrosshairS;
    global.levelchoice = 1

    menu_create(40, 300, 200, 200, 32);
    menu_background(212, 24, 8, 12, 4);
    menu_setdimmed();
    
    menu_addlink("Return to Game", @"
        instance_destroy();
    ");
    menu_addback("", @"
        instance_destroy();
    ");
    if (global.isHost) {
        menu_addlink("Kick players", @"
            if(!instance_exists(ScoreTableController)) instance_create(0,0,ScoreTableController);
            ScoreTableController.showadmin = true;
            instance_destroy();
        ");
    }
    menu_addlink("Options", @"
        instance_destroy();
        instance_create(0,0,OptionsController);
    ");
    menu_addlink("Disconnect", @"
        // Force dedicated mode to off so you can go to main menu instead of just restarting server
        if (show_question("+"\""+@"Do you really want to leave this match?"+"\""+@")) {
            if (global.serverPluginsInUse)
            {
                pluginscleanup(true);
            }
            else
            {
                global.dedicatedMode = 0;
                with(Client)
                    instance_destroy();
                    
                with(GameServer)
                    instance_destroy();
            }
        }
    ");
    menu_addlink("Quit Game", @"
        if (show_question("+"\""+@"Do you really want to quit?"+"\""+@")) {
            game_end();
        }
    ");
}

