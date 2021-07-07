menu_create(48, 172, 500, 260, 32, 40, 112, 128);
menumode = true;

menu_background(512, 24, 8, 12, 4);
bgtabs = true;

menu_addedit_num("Scout:", "global.classlimits[CLASS_SCOUT]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Scout"+"\""+@", argument0);
", 255);
menu_addedit_num("Pyro:", "global.classlimits[CLASS_PYRO]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Pyro"+"\""+@", argument0);
", 255);
menu_addedit_num("Soldier:", "global.classlimits[CLASS_SOLDIER]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Soldier"+"\""+@", argument0);
", 255);
menu_addedit_num("Heavy:", "global.classlimits[CLASS_HEAVY]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Heavy"+"\""+@", argument0);
", 255);
menu_addedit_num("Demoman:", "global.classlimits[CLASS_DEMOMAN]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Demoman"+"\""+@", argument0);
", 255);
menu_addedit_num("Medic:", "global.classlimits[CLASS_MEDIC]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Medic"+"\""+@", argument0);
", 255);
menu_addedit_num("Engineer:", "global.classlimits[CLASS_ENGINEER]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Engineer"+"\""+@", argument0);
", 255);
menu_addedit_num("Spy:", "global.classlimits[CLASS_SPY]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Spy"+"\""+@", argument0);
", 255);
menu_addedit_num("Sniper:", "global.classlimits[CLASS_SNIPER]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Sniper"+"\""+@", argument0);
", 255);
menu_addedit_num("Quote:", "global.classlimits[CLASS_QUOTE]", @"
    gg2_write_ini("+"\""+@"Classlimits"+"\""+@", "+"\""+@"Quote"+"\""+@", argument0);
", 255);

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

