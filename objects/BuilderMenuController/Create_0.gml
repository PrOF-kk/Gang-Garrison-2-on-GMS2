{
    global.levelchoice = 1
    menu_create(40, 524-ds_list_size(global.gamemodes)*32, 200, 200, 32);
    
    menu_background(245, 24, 8, 12, 4);
    if (room == BuilderRoom) menu_setdimmed();
    
    for(i=0;i<ds_list_size(global.gamemodes); i+=1) {
        menu_addlink(ds_map_find_value(ds_list_find_value(global.gamemodes, i), "name"), @"            
            var builder;
            if (!instance_exists(Builder)) builder = instance_create(0,0, Builder);
            else builder = Builder.id;
            
            builder.gamemode = power(2, virtualitem);
            builder.name = item_name[virtualitem];

            if (room != BuilderRoom) room_goto_fix(BuilderRoom);
            else {
                with(Builder) event_user(0);
                instance_destroy();
            }
        ");
    }
    
    if (room == BuilderRoom) {
        menu_addlink("Main menu", @"
            room_goto_fix(Menu);
            with(Builder) instance_destroy();
        ");
        menu_addback("Back", @"
            // Wait 1 frame or the Builder will reopen the menu in the same step.
            alarm[0] = 1;
        ");
    } else {
        menu_addback("Back", @"
            room_goto_fix(Menu);
            with(Builder) instance_destroy();
        ");
    }
}

