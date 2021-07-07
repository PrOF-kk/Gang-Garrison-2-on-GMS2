// Finished/Errored
if (http_step(handle)) {
    // Request failed
    if (http_status_code(handle) != 200)
    {
        // Just give up
        http_destroy(handle);
        instance_destroy();
        exit;
    }

    write_buffer_to_file(http_response_body(handle), tmpfile);
    http_destroy(handle);

    // File doesn't exist
    if (!file_exists(tmpfile))
    {
        instance_destroy();
        exit;
    }

    // Integrity check fails, download failed (presumably)
    if (hash != GG2DLL_compute_MD5(tmpfile))
    {
        instance_destroy();
        exit;
    }
    
    // Delete existing background
    if (file_exists("background.png"))
    {
        file_delete("background.png");
    }

    // Move tempfile
    file_copy(tmpfile, "background.png");
    file_delete(tmpfile);

    // Update Globals & INI
    global.backgroundHash = hash;
    global.backgroundTitle = title;
    global.backgroundURL = url;
    global.backgroundShowVersion = showVersion;
    ini_open("gg2.ini");
    ini_write_string("Background", "BackgroundHash", global.backgroundHash);
    ini_write_string("Background", "BackgroundTitle", global.backgroundTitle);
    ini_write_string("Background", "BackgroundURL", global.backgroundURL);
    ini_write_string("Background", "BackgroundShowVersion", global.backgroundShowVersion);
    ini_close();

    // Make main menu controller reload
    with (MainMenuController)
    {
        event_user(1);
    }

    instance_destroy();
}

