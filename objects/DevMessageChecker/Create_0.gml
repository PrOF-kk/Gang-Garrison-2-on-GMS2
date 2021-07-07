handleCreated = false;

// We only want to check for messages once per run
if(variable_global_exists("devMessagesChecked")) {
    if(global.devMessagesChecked) {
        instance_destroy();
        exit;
    }
}

// downloads a text file off the internet, and parses it for instructions
// from the developers
// If any are found, they will be shown/executed/whatever

var url;
if(global.updaterBetaChannel)
    url = DEVMESSAGES_SOURCE_BETA;
else
    url = DEVMESSAGES_SOURCE;

handle = http_new_get(url);
handleCreated = true;

image_speed = 5/room_speed;

