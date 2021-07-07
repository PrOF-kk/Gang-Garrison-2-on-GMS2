function loadplugins() {
	// self-explanatory
	// borrowed file-search code from Port
	var file, pattern, prefix, list, fp, i, env;

	// Prefix since results from file_find_* don't include path
	prefix = working_directory + "\\Plugins\\";
	pattern = prefix + "*.gml";

	list = ds_list_create();

	// Find files and put in list
	for (file = file_find_first(pattern, 0); file != ""; file = file_find_next())
	{
	    ds_list_add(list, file);
	}

	// Execute plugins
	for (i = 0; i < ds_list_size(list); i += 1)
	{
	    file = ds_list_find_value(list, i);
	    // Debugging facility, so we know *which* plugin caused compile/execute error
	    fp = file_text_open_write(working_directory + "\\last_plugin.log");
	    file_text_write_string(fp, prefix + file);
	    file_text_close(fp);
	    // Create persistent environment for plugin (so its variables won't collide)
	    env = instance_create(0, 0, PluginEnvironment);
	    // Allows plugins to detect which mode they're running in
	    env.isServerSentPlugin = false;
	    env.isLocalPlugin = true;
	    // So the plugin can locate its resources
	    env.directory = prefix;
	    // Execute
	    with (env)
	        execute_file(prefix + file);
	}

	// Clear up
	file_delete(working_directory + "\\last_plugin.log");
	ds_list_destroy(list);



}
