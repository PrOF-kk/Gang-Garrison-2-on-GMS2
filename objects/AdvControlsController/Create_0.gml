{
    menu_create(48, 172, 500, 260, 32, 40, 104, 6);
    menumode = true;
    
    if (room != Options)
        menu_setdimmed();
    
    menu_background(512, 24, 8, 12, 4);
    bgtabs = true;
    
    menu_addedit_keyormouse("Primary Fire:", "global.attack");
    menu_addedit_keyormouse("Secondary Ability:", "global.special");
    menu_addedit_key("Emoticon Menu:", "global.chat1");
    menu_addedit_key("Gameplay Emote Menu:", "global.chat2");
    menu_addedit_key("Direction Emote Menu:", "global.chat3");
    menu_addedit_key("Change Team:", "global.changeTeam");
    menu_addedit_key("Change Class:", "global.changeClass");
    
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

