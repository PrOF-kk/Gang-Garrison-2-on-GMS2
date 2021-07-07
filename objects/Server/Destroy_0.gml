socket_destroy_abortive(pingSocket);
if(pingRunning) {
    global.runningPingCount -= 1;
}
ds_map_destroy(infos);

