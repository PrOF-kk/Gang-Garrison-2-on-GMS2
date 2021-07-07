if(global.useLobbyServer) {
    sendLobbyUnreg();
    sleep(10); // Wait a bit so the networking extension has time to send the packet...
}
if(global.attemptPortForward and portForwarded) {
    upnp_release_port(string(global.hostingPort), "TCP")
    sleep(10); // Wait a bit so the forwarding extension has time to request a release
}

