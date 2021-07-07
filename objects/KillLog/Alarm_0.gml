if (ds_list_size(kills)) {
    ds_map_destroy(ds_list_find_value(kills, 0));
    ds_list_delete(kills, 0);
    
    alarm[0] = 30*5 / global.delta_factor;
}
