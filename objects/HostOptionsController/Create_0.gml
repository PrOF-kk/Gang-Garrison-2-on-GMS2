ini_open("gg2.ini");
global.timeLimitMins = ini_read_real("Server", "Time Limit", 15);
global.caplimit = ini_read_real("Server", "CapLimit", 5);
global.Server_RespawntimeSec = ini_read_real("Server", "Respawn Time", 5);
readClasslimitsFromIni();
ini_close();

//Server respawn time calculator. Converts each second to a frame. (read: multiply by 30 :hehe:)
if (global.Server_RespawntimeSec == 0)
    global.Server_Respawntime = 1;
else
    global.Server_Respawntime = global.Server_RespawntimeSec * 30;

menu_create(48, 172, 500, 260, 32, 40, 112, 128);
menumode = true;

menu_background(512, 24, 8, 12, 4);
bgtabs = true;

menu_addedit_text2("Server Name:", "global.serverName", @"
    var newName;
    newName = string_copy(argument0, 0, 25);
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"ServerName"+"\""+@", newName);
    return newName;
");
menu_addedit_text2("Welcome message:", "global.welcomeMessage", @"
    var newMessage;
    newMessage = string_copy(argument0, 0, 255);
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"WelcomeMessage"+"\""+@", newMessage);
    return newMessage;
");

menu_addedit_text("Password:", "global.serverPassword", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"Password"+"\""+@", argument0);
");
menu_addedit_num("Player Limit:", "global.playerLimit", @"
    gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"PlayerLimit"+"\""+@", argument0);
", 48);
menu_addedit_num("Time Limit (mins):", "global.timeLimitMins", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"Time Limit"+"\""+@", argument0);
");
menu_addedit_num("Capture Limit:", "global.caplimit", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"CapLimit"+"\""+@", argument0);
");
menu_addedit_num("Deathmatch Kill Limit:", "global.killLimit", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"Deathmatch Kill Limit"+"\""+@", argument0);
");
menu_addedit_num("TDM Invulnerability (secs):", "global.tdmInvulnerabilitySeconds", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"Team Deathmatch Invulnerability Seconds"+"\""+@", argument0);
");
menu_addedit_num("Respawn Time (secs):", "global.Server_RespawntimeSec", @"
    gg2_write_ini("+"\""+@"Server"+"\""+@", "+"\""+@"Respawn Time"+"\""+@", argument0);
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

menu_addlink("Start Game", @"
    start_server();
");
menu_addback("Back", @"
    instance_create(x,y,MainMenuController);
    instance_destroy();
");

