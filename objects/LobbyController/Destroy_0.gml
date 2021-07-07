with(Server) {
    instance_destroy();
}

socket_destroy(lobbysocket);
ds_list_destroy(servers);

