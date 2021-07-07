if(!socket)
{
    if(ds_queue_empty(workQueue))
    {
        // Out of work, let's make like a tree before more arrives
        instance_destroy();
        exit;
    }
    
    // pop (and clean up) the next work item
    var item, authbuffer;
    item = ds_queue_dequeue(workQueue);
    currentPlayer = ds_list_find_value(item, 0);
    authbuffer = ds_list_find_value(item, 1);
    ds_list_destroy(item);
    
    // start the next auth check
    socket = tcp_connect(AUTH_SERVER_HOST, AUTH_SERVER_PORT);
    write_buffer(socket, authbuffer);
    fct_buffer_destroy(authbuffer);
    socket_send(socket);
}
else if(!tcp_eof(socket))
{
    tcp_receive_available(socket);
    write_buffer(responseBuffer, socket);
}
else
{
    if(!socket_has_error(socket) and instance_exists(currentPlayer) and fct_buffer_size(responseBuffer)>0)
    {
        var rewards;
        rewards = read_string(responseBuffer, fct_buffer_size(responseBuffer));
        rewardAuthSuccess(currentPlayer, rewards);
    }
    
    socket_destroy(socket);
    socket = 0;
    currentPlayer = noone;
    fct_buffer_clear(responseBuffer);
}

