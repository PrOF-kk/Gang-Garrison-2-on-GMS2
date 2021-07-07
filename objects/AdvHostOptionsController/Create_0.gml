menu_create(48, 172, 500, 260, 32, 40, 112, 128);
menumode = true;

menu_background(512, 24, 8, 12, 4);
bgtabs = true;

menu_addedit_num("Hosting Port:", "global.hostingPort", @"
    gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"HostingPort"+"\""+@", argument0);
", 65535);

menu_addedit_script("Map Rotation:", menu_format_maprotation_filepath(global.mapRotationFile), @"
    var absPath;

    absPath = get_open_filename("+"\""+@"Map Rotation|*.txt"+"\""+@", "+"\""+@""+"\""+@");

    if (absPath == "+"\""+@""+"\""+@") {
        global.mapRotationFile = absPath;
    } else {
        global.mapRotationFile = getRelativePathIfDescendant(working_directory + "+"\""+@"\"+"\""+@", absPath);
    }
    
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"MapRotation"+"\""+@", global.mapRotationFile);
    
    load_map_rotation();
    return menu_format_maprotation_filepath(global.mapRotationFile);
");

menu_addedit_select("Shuffle map rotation:", "global.shuffleRotation", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"ShuffleRotation"+"\""+@", argument0);
");
menu_add_option(0, "Don't shuffle");
menu_add_option(1, "Shuffle (no arena initial map)");
menu_add_option(2, "Shuffle without bias");

menu_addedit_text("Server Sent Plugins:", "global.serverPluginList", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"ServerPluginList"+"\""+@", argument0);
");

menu_addedit_boolean("Auto Balance:", "global.autobalance", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"AutoBalance"+"\""+@", argument0);
");
menu_addedit_boolean("Announce to Lobby:", "global.useLobbyServer", @"
    gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"UseLobby"+"\""+@", argument0);
");
menu_addedit_boolean("Attempt UPnP Forwarding:", "global.attemptPortForward", @"
    if (argument0 == 1)
        show_message("+"\""+@"Warning: UPNP support is currently experimental and enabling it may cause freezing while starting a server, but should cause no freezing ingame"+"\""+@")
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"Attempt UPnP Forwarding"+"\""+@", argument0);
");

menu_addlink("Start Game", @"
    start_server();
");

menu_addtablink("Main", @"
    instance_create(x,y,HostOptionsController);
    instance_destroy();
");
menu_addtablink("Advanced", @"
    instance_create(x,y,AdvHostOptionsController);
    instance_destroy();
");
menu_addtablink("Classlimits", @"
    instance_create(x,y,ClasslimitsMenuController);
    instance_destroy();
");

menu_addback("Back", @"
    instance_create(x,y,MainMenuController);
    instance_destroy();
");

