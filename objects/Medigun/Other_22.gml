if(instance_exists(healTarget))
    write_ubyte(global.serializeBuffer, ds_list_find_index(global.players, healTarget));
else
    write_ubyte(global.serializeBuffer, 255);

