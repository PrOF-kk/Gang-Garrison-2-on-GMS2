{
    event_user(0);
    if((not done) and (class != global.myself.class))
    {
        ClientPlayerChangeclass(class, global.serverSocket);
        socket_send(global.serverSocket);
    }
    done=true;
}

