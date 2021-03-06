image_speed = 5/room_speed;

if (http_step(handle)) {
    // Request failed
    if (http_status_code(handle) != 200) {
        // Just give up
        instance_destroy();
        exit;
    }

    var data;
    data = http_response_body(handle);
    data = read_string(data, fct_buffer_size(data));

    global.devMessagesChecked = true;

    // split into lines by LF
    data = split(data, chr(10));
    
    var c;
    for(c = 0; c < ds_list_size(data); c += 2)
    {
        switch(ds_list_find_value(data, c))
        {
        case "ShowMessage":
            var popup;
            popup = instance_create(250, 471, DevMessagePopup);
            popup.msg = ds_list_find_value(data, c + 1);
            break;
        case "Version":
            versioncheck = ds_list_find_value(data, c + 1);
            versionend = string_pos("!",versioncheck);
            version = string_copy(versioncheck,1,versionend-1);
            changeslength = string_length(versioncheck)-versionend;
            changes=string_copy(versioncheck,versionend+1,changeslength);
            if(real(version) > VERSION)
            {
                var popup;
                popup = instance_create(250, 471, DevMessagePopup);
                popup.msg = "Updates have been made to Gang Garrison 2!##"+changes;
                popup.updating = true;
            }
            break;
        case "Background":
            var text, list, hash, title, url, showVersion;
            text = ds_list_find_value(data, c + 1);
            list = ds_list_create();

            // split string by |
            while (string_pos("|", text) != 0)
            {
                ds_list_add(list, string_copy(text,0,string_pos("|",text)-1));
                text = string_copy(text,string_pos("|",text)+1,string_length(text)-string_pos("|",text));
            }
            ds_list_add(list, text);

            hash = ds_list_find_value(list, 0);
            title = ds_list_find_value(list, 1);
            url = ds_list_find_value(list, 2);
            showVersion = (ds_list_find_value(list, 3) == "true");

            ds_list_destroy(list);

            // current background should be default
            if (hash == "default")
            {
                if (global.backgroundHash != "default")
                {
                    // reset to default background
                    global.backgroundHash = "default";
                    global.backgroundTitle = "";
                    global.backgroundURL = "";
                    global.backgroundShowVersion = true;
                    ini_open("gg2.ini");
                    ini_write_string("Background", "BackgroundHash", global.backgroundHash);
                    ini_write_string("Background", "BackgroundTitle", global.backgroundTitle);
                    ini_write_string("Background", "BackgroundURL", global.backgroundURL);
                    ini_write_real("Background", "BackgroundShowVersion", global.backgroundShowVersion);
                    ini_close();
    
                    // Delete downloaded background if existant
                    if (file_exists("background.png"))
                    {
                        file_delete("background.png");
                    }
    
                    // fade in
                    with (MainMenuController)
                    {
                        event_user(1);
                    }
                }
            }
            // current background different from downloaded
            else if (hash != global.backgroundHash)
            {
                // download
                var downloader;
                downloader = instance_create(0, 0, BackgroundDownloader);
                downloader.hash = hash;
                downloader.title = title;
                downloader.url = url;
                downloader.showVersion = showVersion;
            }
            // current background same as downloaded, updated title/URL/show version flag
            else if (title != global.backgroundTitle
                || url != global.backgroundURL
                || showVersion != global.backgroundShowVersion)
            {
                global.backgroundTitle = title;
                global.backgroundURL = url;
                global.backgroundShowVersion = showVersion;
                ini_open("gg2.ini");
                ini_write_string("Background", "BackgroundTitle", global.backgroundTitle);
                ini_write_string("Background", "BackgroundURL", global.backgroundURL);
                ini_write_real("Background", "BackgroundShowVersion", global.backgroundShowVersion);
                ini_close();
            }
            break;
        }
    }

    ds_list_destroy(data);
    
    instance_destroy();
    exit;
}

