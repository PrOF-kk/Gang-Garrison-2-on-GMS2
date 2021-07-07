pingSocket = -1;
pingRunning = false;
pingFinished = false;
infos = ds_map_create();

if(!variable_global_exists("runningPingCount")) {
    global.runningPingCount = 0;
}

