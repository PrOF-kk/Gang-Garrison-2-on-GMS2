if(not nocreate) {
    socket_destroy(global.serverSocket);
    ds_list_destroy(global.players);
    fct_buffer_destroy(global.deserializeBuffer);
    fct_buffer_destroy(downloadMapBuffer);
    
    with(Player)
        instance_destroy();
        
    with(PlayerControl)
        instance_destroy();

    room_goto_fix(returnRoom);
    if (global.serverPluginsInUse && !noUnloadPlugins)
        pluginscleanup();
}


