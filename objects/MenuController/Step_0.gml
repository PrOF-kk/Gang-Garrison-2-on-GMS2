if(!variable_local_exists("baseybegin"))
{
    baseybegin = ybegin;
    mouse_samples = ds_list_create();
}
if(__view_get( e__VW.HView, 0 ) < 600)
{
    ds_list_add(mouse_samples, window_mouse_get_y());
    while(ds_list_size(mouse_samples) > 10)
        ds_list_delete(mouse_samples, 0);
    var des_y;
    des_y = 0;
    for(i = 0; i < ds_list_size(mouse_samples); i += 1)
        des_y += ds_list_find_value(mouse_samples, i);
    des_y /= ds_list_size(mouse_samples);
    
    ybegin = round(baseybegin
                   - min(1, max(0, des_y/__view_get( e__VW.HView, 0 )))
                     *(600-__view_get( e__VW.HView, 0 )));
}
stepHasRun = true;

var itemcount;
menu_hack_backbutton();
itemcount = menu_get_itemcount();

if(editing != -1) {
    switch (item_type[editing]) {
        case "edittext2":
        case "edittext":
        case "editnum":
            if (keyboard_check(vk_control) && keyboard_check(ord("V"))) {
                keyboard_string += clipboard_get_text();
                keyboard_clear(ord("V"));
            }
            item_value[editing] = keyboard_string;
            break;
        case "editkeyormouse":
            if mouse_check_button(mb_left) {
                menu_set_var(editing, MOUSE_LEFT);
                execute_string(item_script[editing], MOUSE_LEFT);
                editing = -1;
                exit;
            }
            else if mouse_check_button(mb_right) {
                menu_set_var(editing, MOUSE_RIGHT);
                execute_string(item_script[editing], MOUSE_RIGHT);
                editing = -1;
                exit;
            }
        case "editkey":
            if keyboard_check_direct(vk_tab) keyboard_lastkey = vk_tab;
            if keyboard_lastkey != 0 {
                menu_set_var(editing, keyboard_lastkey);
                execute_string(item_script[editing], menu_get_var(editing));
                editing = -1;
                exit;
            }
    }
} else if(mouse_x > __view_get( e__VW.XView, 0 )+xbegin) {
    if(mouse_y >= __view_get( e__VW.YView, 0 )+ybegin-(spacing/2) and mouse_x < __view_get( e__VW.XView, 0 )+xbegin+width)
    {
        virtualitem = max(0, round((mouse_y-(__view_get( e__VW.YView, 0 )+ybegin))/spacing));
        if(mouse_check_button_pressed(mb_left)){
            mouse_clear(mb_left);
            if(virtualitem < itemcount) {
                switch (item_type[virtualitem]) {
                    case "script":
                        execute_string(item_script[virtualitem]);
                        break;
                    case "editscript":
                        item_value[virtualitem] = execute_string(item_script[virtualitem]);
                        break;
                    case "editkey":
                    case "editkeyormouse":
                        io_clear();
                        editing = virtualitem;
                        break;
                    case "edittext":
                    case "edittext2":
                    case "editnum":
                        keyboard_string = "";
                        editing = virtualitem;
                        break;
                    case "editselect":
                        item_value[virtualitem] = (item_value[virtualitem]+1) mod item_options[virtualitem];
                        menu_set_var(virtualitem, item_option_value[virtualitem, item_value[virtualitem]]);
                        execute_string(item_script[virtualitem], menu_get_var(virtualitem));
                        break;
                }
            }
        }
    }
    else if(mouse_y < __view_get( e__VW.YView, 0 )+ybegin-taboffset+spacing/2 and mouse_y > __view_get( e__VW.YView, 0 )+ybegin-taboffset-spacing/2
            and mouse_x > __view_get( e__VW.XView, 0 )+xbegin+tabmargin and mouse_x < __view_get( e__VW.XView, 0 )+xbegin+tabmargin+tabspacing*tabs)
    {
        virtualitem = min(-2, -2-floor((mouse_x-(__view_get( e__VW.XView, 0 )+xbegin+tabmargin))/tabspacing));
        if(mouse_check_button_pressed(mb_left))
        {
            mouse_clear(mb_left);
            if(-2-virtualitem < tabs)
            {
                execute_string(tab_script[-2-virtualitem]);
            }
        }
    } else {
        virtualitem = -1;
    }
} else {
    virtualitem = -1;
}

