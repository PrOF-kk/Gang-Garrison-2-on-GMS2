function menu_addedit_key(argument0, argument1, argument2) {
	// argument0 - name
	// argument1 - name of the variable this setting is bound to
	// argument2 - GML code to run upon change (argument0 is new value)

	item_name[items] = argument0;
	item_type[items] = "editkey";
	item_var[items] = argument1;
	item_script[items] = argument2;
	items += 1;



}
