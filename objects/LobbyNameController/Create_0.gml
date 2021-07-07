menu_create(312, 116, 250, 100, 30);

menu_background(272, 24, 8, 12, 4);

menu_addedit_text2("Player name:", "global.playerName", @"
    var newName;
    newName = string_copy(argument0, 0, min(string_length(argument0), MAX_PLAYERNAME_LENGTH));
    gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"PlayerName"+"\""+@", newName);
    oldPlayerName = newName;
    return newName;
");

