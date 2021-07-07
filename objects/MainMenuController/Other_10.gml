global.isHost = true;
if(global.dedicatedMode == 0)
{
    with(DevMessageChecker)
        instance_destroy();
    with(DevMessagePopup)
        instance_destroy();
    instance_create(x,y,HostOptionsController);
    instance_destroy();
}
else {
    global.gameServer = instance_create(0,0,GameServer);    
}

