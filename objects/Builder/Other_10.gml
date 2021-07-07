TOGGLE = 0;
TOGGLED = 1;
TEXT = 2;

TOOLTIP = 0;
TOGGLED = 1;
SPRITE = 2;
IMAGE = 3;
INDEX = 4;
SCALE = 5;

var i, button, j, properties;
for(i=0; i<ds_list_size(global.buttons); i+=1) {
    button = ds_list_find_value(global.buttons, i);
    buttons[i, TOGGLE] = ds_map_find_value(button, "toggle");
    buttons[i, TOGGLED] = ds_map_find_value(button, "active");
    buttons[i, TEXT] = ds_map_find_value(button, "name");
}

j=0;
for(i=0; i<ds_list_size(global.entities); i+=1) {
    button = ds_list_find_value(global.entityData, i);
    if (ds_map_find_value(button, "gamemode") != 0 && (ds_map_find_value(button, "gamemode") == -1 || (ds_map_find_value(button, "gamemode") & gamemode) > 0 || gamemode == 1)) {
        entityButtons[j, TOGGLED] = false;
        entityButtons[j, SPRITE] = ds_map_find_value(button, "button_sprite");
        entityButtons[j, IMAGE] = ds_map_find_value(button, "button_image");
        entityButtons[j, TOOLTIP] = ds_map_find_value(button, "tooltip");
        entityButtons[j, INDEX] = i;
        
        properties = ds_map_find_value(button, "properties");
        entityButtons[j, SCALE] = (is_string(ds_map_find_value(properties, "xscale")) && is_string(ds_map_find_value(properties, "yscale")));
        j+=1;
    }
}

entityButtonCount = j;
resetToggles();
startX[1] = __view_get( e__VW.WView, 0 ) - vItems*entityButtonSize - 1;
startX[2] = __view_get( e__VW.WView, 0 ) - layerWidth - 1;
startY[2] = __view_get( e__VW.HView, 0 ) - layerHeight - buttonHeight - 1;

