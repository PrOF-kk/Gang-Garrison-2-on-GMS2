function loadserverplugins(argument0) {
	// loads plugins from ganggarrison.com asked for by server
	// argument0 - comma separated plugin list (pluginname@md5hash)
	// returns true on success, false on failure
	var list, hashList, text, i, pluginname, pluginhash, realhash, url, handle, filesize, progress, tempfile, tempdir, failed, lastContact, isCached, env;

	failed = false;
	list = ds_list_create();
	lastContact = 0;
	isCached = false;
	isDebug = false;
	hashList = ds_list_create();

	// split plugin list string
	list = split(argument0, ",");

	// Split hashes from plugin names
	for (i = 0; i < ds_list_size(list); i += 1)
	{
	    text = ds_list_find_value(list, i);
	    pluginname = string_copy(text, 0, string_pos("@", text) - 1);
	    pluginhash = string_copy(text, string_pos("@", text) + 1, string_length(text) - string_pos("@", text));
	    ds_list_replace(list, i, pluginname);
	    ds_list_add(hashList, pluginhash);
	}

	// Check plugin names and check for duplicates
	for (i = 0; i < ds_list_size(list); i += 1)
	{
	    pluginname = ds_list_find_value(list, i);
    
	    // invalid plugin name
	    if (!checkpluginname(pluginname))
	    {
	        show_message("Error loading server-sent plugins - invalid plugin name:#\"" + pluginname + "\"");
	        return false;
	    }
	    // is duplicate
	    else if (ds_list_find_index(list, pluginname) != i)
	    {
	        show_message("Error loading server-sent plugins - duplicate plugin:#\"" + pluginname + "\"");
	        return false;
	    }
	}

	// Download plugins
	for (i = 0; i < ds_list_size(list); i += 1)
	{
	    pluginname = ds_list_find_value(list, i);
	    pluginhash = ds_list_find_value(hashList, i);
	    isDebug = file_exists(working_directory + "\\ServerPluginsDebug\\" + pluginname + ".zip");
	    isCached = file_exists(working_directory + "\\ServerPluginsCache\\" + pluginname + "@" + pluginhash);
	    tempfile = temp_directory + "\\" + pluginname + ".zip.tmp";
	    tempdir = temp_directory + "\\" + pluginname + ".tmp";

	    // check to see if we have a local copy for debugging
	    if (isDebug)
	    {
	        file_copy(working_directory + "\\ServerPluginsDebug\\" + pluginname + ".zip", tempfile);
	        // show warning
	        if (global.isHost)
	        {
	            show_message(
	                "Warning: server-sent plugin '"
	                + pluginname
	                + "' is being loaded from ServerPluginsDebug. Make sure clients have the same version, else they may be unable to connect."
	            );
	        }
	        else
	        {
	            show_message(
	                "Warning: server-sent plugin '"
	                + pluginname
	                + "' is being loaded from ServerPluginsDebug. Make sure the server has the same version, else you may be unable to connect."
	            );
	        }
	    }
	    // otherwise, check if we have it cached
	    else if (isCached)
	    {
	        file_copy(working_directory + "\\ServerPluginsCache\\" + pluginname + "@" + pluginhash, tempfile);
	    }
	    // otherwise, download as usual
	    else
	    {
	        // construct the URL
	        // http://www.ganggarrison.com/plugins/$PLUGINNAME$@$PLUGINHASH$.zip)
	        url = PLUGIN_SOURCE + pluginname + "@" + pluginhash + ".zip";
        
	        // let's make the download handle
	        handle = http_new_get(url);
        
	        // download it
	        while (!http_step(handle)) {
	            // prevent game locking up
	            io_handle();
            
	            if (!global.isHost) {
	                // send ping if we haven't contacted server in 20 seconds
	                // we need to do this to keep the connection open
	                if (current_time-lastContact > 20000) {
	                    write_byte(global.serverSocket, PING);
	                    socket_send(global.serverSocket);
	                    lastContact = current_time;
	                }
	            }

	            // draw progress bar since they may be waiting a while
	            filesize = http_response_body_size(handle);
	            progress = http_response_body_progress(handle);
	            draw_background_ext(__background_get( e__BG.Index, 0 ), 0, 0, __background_get( e__BG.XScale, 0 ), __background_get( e__BG.YScale, 0 ), 0, c_white, 1);
	            draw_set_color(c_white);
	            draw_set_alpha(1);
	            draw_set_halign(fa_left);
	            draw_rectangle(50, 550, 300, 560, 2);
	            draw_text(50, 530, string_hash_to_newline("Downloading server-sent plugin " + string(i + 1) + "/" + string(ds_list_size(list)) + " - \"" + pluginname + "\""));
	            // If the URL we fetch is a redirect with no body, size might briefly be 0
	            // Also, Faucet HTTP reports an unknown size as -1
	            if (filesize > 0)
	                draw_rectangle(50, 550, 50 + progress / filesize * 250, 560, 0);
	            screen_refresh();
	        }

	        // request failed
	        if (http_status_code(handle) != 200)
	        {
	            show_message("Error loading server-sent plugins - download failed for \"" + pluginname + "\":#" + string(http_status_code(handle)) + " " + http_reason_phrase(handle));
	            failed = true;
	            break;
	        }
	        else
	        {
	            write_buffer_to_file(http_response_body(handle), tempfile);
	            if (!file_exists(tempfile))
	            {
	                show_message("Error loading server-sent plugins - download failed for \"" + pluginname + "\":# No such file?");
	                failed = true;
	                break;
	            }
	        }

	        http_destroy(handle);
	    }

	    // check file integrity
	    realhash = GG2DLL_compute_MD5(tempfile);
	    if (realhash != pluginhash)
	    {
	        show_message("Error loading server-sent plugins - integrity check failed (MD5 hash mismatch) for:#\"" + pluginname + "\"");
	        failed = true;
	        break;
	    }
    
	    // don't try to cache debug plugins
	    if (!isDebug)
	    {
	        // add to cache if we don't already have it
	        if (!file_exists(working_directory + "\\ServerPluginsCache\\" + pluginname + "@" + pluginhash))
	        {
	            // make sure directory exists
	            if (!directory_exists(working_directory + "\\ServerPluginsCache"))
	            {
	                directory_create(working_directory + "\\ServerPluginsCache");
	            }
	            // store in cache
	            file_copy(tempfile, working_directory + "\\ServerPluginsCache\\" + pluginname + "@" + pluginhash);
	        }
	    }

	    // let's get 7-zip to extract the files
	    extractzip(tempfile, tempdir);
    
	    // if the directory doesn't exist, extracting presumably failed
	    if (!directory_exists(tempdir))
	    {
	        show_message("Error loading server-sent plugins - extracting zip failed for:#\"" + pluginname + "\"");
	        failed = true;
	        break;
	    }
	}

	if (!failed)
	{
	    // Execute plugins
	    for (i = 0; i < ds_list_size(list); i += 1)
	    {
	        pluginname = ds_list_find_value(list, i);
	        tempdir = temp_directory + "\\" + pluginname + ".tmp";
        
	        // Debugging facility, so we know *which* plugin caused compile/execute error
	        fp = file_text_open_write(working_directory + "\\last_plugin.log");
	        file_text_write_string(fp, pluginname);
	        file_text_close(fp);

	        // packetID is (i), so make queues for it
	        ds_map_add(global.pluginPacketBuffers, i, ds_queue_create());
	        ds_map_add(global.pluginPacketPlayers, i, ds_queue_create());

	        // Create persistent environment for plugin (so its variables won't collide)
	        env = instance_create(0, 0, PluginEnvironment);
	        // Allows plugins to detect which mode they're running in
	        env.isServerSentPlugin = true;
	        env.isLocalPlugin = false;
	        // So the plugin can locate its resources
	        env.directory = tempdir;
	        // The packet ID needed for the PluginPacket* functions
	        env.packetID = i;

	        // Execute plugin
	        with (env)
	            execute_file(
	                // the plugin's main gml file must be in the root of the zip
	                // it is called plugin.gml
	                tempdir + "\\plugin.gml",
	                // For backwards-compatibility, we continue to pass these as arguments
	                tempdir,
	                i
	            );
	    }
	}

	// Delete last plugin log
	file_delete(working_directory + "\\last_plugin.log");

	// Get rid of plugin list
	ds_list_destroy(list);

	// Get rid of plugin hash list
	ds_list_destroy(hashList);

	return !failed;



}
