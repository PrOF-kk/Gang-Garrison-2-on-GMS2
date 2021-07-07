if(global.useLobbyServer) {
    sendLobbyUnreg();
}

ds_list_destroy(global.players);
socket_destroy(global.tcpListener);
socket_destroy(global.serverSocket);
fct_buffer_destroy(serverId);

with(Player)
    instance_destroy();

with(JoiningPlayer)
    instance_destroy();
    
with(PlayerControl)
    instance_destroy();
    
if (global.attemptPortForward and portForwarded)
    upnp_release_port(string(global.hostingPort), "TCP")

if (instance_exists(Builder))
    room_goto_fix(BuilderRoom);
else
    room_goto_fix(Menu);

if (global.serverPluginsInUse)
    pluginscleanup();
    
set_synchronization(global.monitorSync);

