function sendLobbyUnreg() {
	var iplookup;

	/* Blocking IP lookup. This unreg function is only called when closing the server so
	 * blocking is acceptable, and in case the user is closing the game we need to make
	 * sure the UDP packet is sent before GM shuts down the networking extension.
	 */
	iplookup = ip_lookup_create(LOBBY_SERVER_HOST);

	while(!ip_lookup_ready(iplookup))
	    sleep(10);
    
	if(ip_lookup_has_next(iplookup))
	{
	    var lobbyIp, lobbyBuffer;
	    lobbyIp = ip_lookup_next_result(iplookup);
    
	    lobbyBuffer = buffer_create();
	    parseUuid("488984ac-45dc-86e1-9901-98dd1c01c064", lobbyBuffer); // Message Type "unregister"
	    write_buffer(lobbyBuffer, GameServer.serverId);
	    udp_send(lobbyBuffer, lobbyIp, LOBBY_SERVER_PORT);
	    buffer_destroy(lobbyBuffer);
	}
	ip_lookup_destroy(iplookup);




}
