if(cooleddown) {
    with(LobbyController) {
        instance_destroy();
    }
    
    instance_create(0,0,LobbyController);
    cooleddown = false;
    alarm[1] = 90;
}

