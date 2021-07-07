if(!pingRunning and !pingFinished and global.runningPingCount < 10) {
    global.runningPingCount += 1;
    pingSocket = tcp_connect(ip, port);
    pingStartTime = current_time;
    pingRunning = true;
} else if(pingRunning and !pingFinished) {
    var timeSinceStart, timeout;
    timeSinceStart = current_time - pingStartTime;
    timeout = timeSinceStart > 2000;
    if((not socket_connecting(pingSocket)) or timeout) {
        if(socket_has_error(pingSocket)) {
            ping = -1;
        } else if(timeout) {
            ping = 1999;
        } else {
            ping = timeSinceStart;
        }
        socket_destroy_abortive(pingSocket);
        global.runningPingCount -= 1;
        var that;
        that = id;
        with (LobbyController) {
            ds_list_sorted_insert(servers, that, compareServersByCompatAndPing);
        }
        pingSocket = -1;
        pingRunning = false;
        pingFinished = true;
    }
}

