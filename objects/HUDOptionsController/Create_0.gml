{
    menu_create(48, 172, 500, 260, 32, 40, 104, 6);
    menumode = true;
    
    if(room != Options)
        menu_setdimmed();
    
    menu_background(512, 24, 8, 12, 4);
    bgtabs = true;
    
    menu_addedit_select("Timer Position", "global.timerPos", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Timer Position"+"\""+@", argument0);
    ");
    menu_add_option(0, "Center");
    menu_add_option(1, "Left");
    
    menu_addedit_select("Kill Log Position", "global.killLogPos", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Kill Log Position"+"\""+@", argument0);
    ");
    menu_add_option(0, "Default");
    menu_add_option(1, "Just Below Timers");
    
    menu_addedit_select("KOTH Timer Orientation", "global.kothHudPos", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@","+"\""+@"KoTH HUD Position"+"\""+@", argument0);
    ");
    menu_add_option(0, "Default");
    menu_add_option(1, "Stacked");
    
    menu_addedit_boolean("Fade Scoreboard:", "global.fadeScoreboard", @"
        gg2_write_ini("+"\""+@"Settings"+"\""+@", "+"\""+@"Fade Scoreboard"+"\""+@", argument0);
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

