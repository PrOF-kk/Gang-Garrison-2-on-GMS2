{
    menu_create(48, 172, 500, 260, 32, 40, 104, 6);
    menumode = true;
    
    if (room != Options)
        menu_setdimmed();
    
    menu_background(512, 24, 8, 12, 4);
    bgtabs = true;
    
    menu_addedit_key("Jump/up:", "global.jump");
    menu_addedit_key("Down:", "global.down");
    menu_addedit_key("Left:", "global.left");
    menu_addedit_key("Right:", "global.right");
    menu_addedit_key("Jump/up (Alternate):", "global.jump2");
    menu_addedit_key("Down (Alternate):", "global.down2");
    menu_addedit_key("Left (Alternate):", "global.left2");
    menu_addedit_key("Right (Alternate):", "global.right2");
    menu_addedit_key("Taunt:", "global.taunt");
    menu_addedit_key("Call for Healer:", "global.medic");
    menu_addedit_key("Drop Case:", "global.drop");
    menu_addedit_key("Show Scores:", "global.showScores");
    
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

