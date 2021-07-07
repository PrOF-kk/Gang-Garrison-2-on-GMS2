virtualitem = -1;
xbegin = 112;
ybegin = 152;
spacing = 40;
width = 440; 
items = 10;
offset = 0;

servers = ds_list_create();

numServers = -1;
serversRead = 0;
serverInfoLength = -1;

lobbysocket = tcp_connect(LOBBY_SERVER_HOST, LOBBY_SERVER_PORT);
set_little_endian(lobbysocket, false);

// List protocol ID
parseUuid("297d0df4-430c-bf61-640a-640897eaef57", lobbysocket);

// Send Lobby UUID (big endian)
write_buffer(lobbysocket, global.gg2lobbyId);

socket_send(lobbysocket);

