if(editing != -1) { 
    switch (item_type[editing]) {
        case "edittext":
            menu_set_var(editing, item_value[editing]);
            execute_string(item_script[editing], item_value[editing]);
            break;
        case "edittext2":
            item_value[editing] = execute_string(item_script[editing], item_value[editing]);
            menu_set_var(editing, item_value[editing]);
            break;
        case "editnum":
            var newval;
            newval = real(string_digits(item_value[editing]));
            if(item_limit[editing]>0)
                newval = min(newval, item_limit[editing]);
            menu_set_var(editing, newval);
            execute_string(item_script[editing], menu_get_var(editing));
            item_value[editing] = string(menu_get_var(editing));
            break;
    }
    editing = -1;
}

