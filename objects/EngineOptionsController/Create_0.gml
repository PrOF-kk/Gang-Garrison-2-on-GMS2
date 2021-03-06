{
    warnoptioneffect = false;
    menu_create(48, 172, 500, 260, 32, 40, 104, 6);
    menumode = true;

    if(room != Options)
        menu_setdimmed();
    
    menu_background(512, 24, 8, 12, 4);
    bgtabs = true;
    
    menu_addedit_boolean("Fullscreen:", "global.fullscreen", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Fullscreen"+"\""+@", argument0);
        window_set_fullscreen(argument0);
    ");
    menu_addedit_select("Music:", "global.music", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Music"+"\""+@", argument0);
        if(room != Options)
        {
            if (argument0 == MUSIC_BOTH || argument0 == MUSIC_INGAME_ONLY)
            {
                AudioControlPlaySong(global.IngameMusic, true);
            }
            else
            {
                AudioControlPlaySong(-1, false);
            }
        }
        else
        {
            if(argument0 == MUSIC_BOTH || argument0 == MUSIC_MENU_ONLY)
            {
                AudioControlPlaySong(global.MenuMusic, true);
            }
            else
            {
                AudioControlPlaySong(-1, false);
            }
        }
    ");
    menu_add_option(MUSIC_NONE, "None");
    menu_add_option(MUSIC_MENU_ONLY, "Menu Only");
    menu_add_option(MUSIC_INGAME_ONLY, "In-Game Only");
    menu_add_option(MUSIC_BOTH, "Menu and In-Game");
    
    menu_addedit_select("Particles:", "global.particles", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Particles"+"\""+@", argument0);
    ");
    menu_add_option(PARTICLES_NORMAL, "Normal");
    menu_add_option(PARTICLES_OFF, "Disabled");
    menu_add_option(PARTICLES_ALTERNATIVE, "Alternative (faster)");
    
    menu_addedit_select("Gibs:", "global.gibLevel", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Gib Level"+"\""+@", argument0);
    ");
    menu_add_option(0, "Disabled");
    menu_add_option(1, "Blood only");
    menu_add_option(2, "Blood and medium gibs");
    menu_add_option(3, "Full blood and gibs");

    menu_addedit_boolean("Hide Infiltrator 'Ghosts':", "global.hideSpyGhosts", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Hide Spy Ghosts"+"\""+@", argument0);
    ");
    
    menu_addedit_select("Ingame Aspect Ratio:", "global.resolutionkind", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Resolution"+"\""+@", argument0);
        if(room != Options)
            warnoptioneffect = !global.isHost;
        global.changed_resolution = true;
    ");
    menu_add_option(0, "5:4");
    menu_add_option(1, "4:3");
    menu_add_option(2, "16:10");
    menu_add_option(3, "16:9");
    menu_add_option(4, "2:1");
    
    menu_addedit_select("Framerate:", "global.frameratekind", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Framerate"+"\""+@", argument0);
        if(room != Options)
            warnoptioneffect = !global.isHost;
    ");
    menu_add_option(0, "30");
    menu_add_option(1, "60");
    
    menu_addedit_select("V Sync:", "global.monitorSync", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Monitor Sync"+"\""+@", argument0);
        if (!instance_exists(GameServer))
            set_synchronization(argument0);
    ");
    menu_add_option(0, "Off");
    menu_add_option(1, "On unless hosting");
    menu_addedit_boolean("Prompt for server-sent plugins:", "global.serverPluginsPrompt", @"
        if (argument0 == false)
            show_message("+"\""+@"Please note that plugins can be dangerous, so you should only disable the prompt if you trust all plugins hosted at the source:#"+"\""+@" + PLUGIN_SOURCE + "+"\""+@"#"+"\""+@" + PLUGIN_SOURCE_NOTICE)
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"ServerPluginsPrompt"+"\""+@", argument0);
    ");
    menu_addedit_boolean("Prompt for restart:", "global.restartPrompt", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"RestartPrompt"+"\""+@", argument0);
    ");
    
    menu_addtablink("Ingame", @"
        instance_destroy();
        instance_create(x,y,OptionsController);
    ");
    menu_addtablink("Engine", @"
        instance_destroy();
        instance_create(x,y,EngineOptionsController);
    ");
    menu_addtablink("Controls 1", @"
        instance_destroy();
        instance_create(x,y,ControlsController);
    ");
    menu_addtablink("Controls 2", @"
        instance_destroy();
        instance_create(x,y,AdvControlsController);
    ");
    menu_addtablink("HUD", @"
        instance_destroy();
        instance_create(x,y,HUDOptionsController);
    ");
    
    menu_addback("Back", @"
        if(warnoptioneffect)
            show_message("+"\""+@"An option you changed only takes effect on map change or server join."+"\""+@");
        instance_destroy();
        if(room == Options)
            room_goto_fix(Menu);
        else
            instance_create(0,0,InGameMenuController);
    ");
}

