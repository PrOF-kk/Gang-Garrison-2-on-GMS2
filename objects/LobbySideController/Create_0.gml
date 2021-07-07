menu_create(24, 148, 72, 100, 30);

menu_background(80, 24, 8, 12, 4);

menu_addlink("Refresh", @"
    event_user(0);
");
menu_addback("Back", @"
    room_goto_fix(Menu);
");

cooleddown = false;
alarm[1] = 90;

