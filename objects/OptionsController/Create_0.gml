{
    menu_create(48, 172, 500, 260, 32, 40, 104, 6);
    menumode = true;
    
    if (room != Options)
        menu_setdimmed();
    
    menu_background(512, 24, 8, 12, 4);
    bgtabs = true;
    
    oldPlayerName = global.playerName;
    menu_addedit_text2("Player name:", "global.playerName", @"
        var newName;
        newName = string_copy(argument0, 0, min(string_length(argument0), MAX_PLAYERNAME_LENGTH));
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"PlayerName"+"\""+@", newName);
        if(room != Options and newName != oldPlayerName)
        {
            write_ubyte(global.serverSocket, PLAYER_CHANGENAME);
            write_ubyte(global.serverSocket, string_length(newName));
            write_string(global.serverSocket, newName);
            socket_send(global.serverSocket);
        }
        oldPlayerName = newName;
        return newName;
    "); 
    menu_addedit_boolean("Healer Radar:", "global.medicRadar", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Healer Radar"+"\""+@", argument0);
    ");
    menu_addedit_boolean("Show Healer:", "global.showHealer", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Show Healer"+"\""+@", argument0);
    ");
    menu_addedit_boolean("Show Healing:", "global.showHealing", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Show Healing"+"\""+@", argument0);
    ");
    menu_addedit_boolean("Additional Healthbar:", "global.showHealthBar", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Show Healthbar"+"\""+@", argument0);
    ");
    menu_addedit_boolean("Additional Teammate Stats:", "global.showTeammateStats", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Show Extra Teammate Stats"+"\""+@", argument0);
    ");
    menu_addedit_boolean("Kill Cam:", "global.killCam", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Kill Cam"+"\""+@", argument0);
    ");
    menu_addedit_boolean("Queued Jumping (Bunnyhopping):", "global.queueJumping", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Queued Jumping"+"\""+@", argument0);
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
        instance_destroy();
        if(room == Options)
            room_goto_fix(Menu);
        else
            instance_create(0,0,InGameMenuController);
    ");
}

