action_inherited();
{
    var i, mine;
    receiveCompleteMessage(global.serverSocket, 1, global.deserializeBuffer);
    lobbed = read_ubyte(global.deserializeBuffer);
    
    with(Mine) {
        if(ownerPlayer == other.ownerPlayer) {
            instance_destroy();
        }
    }
    
    for(i=0; i<lobbed; i+=1) {
        mine = instance_create(0,0,Mine);
        mine.owner = owner;
        mine.ownerPlayer = ownerPlayer;
        mine.team = owner.team;
        with(mine) {
            event_user(13);
        }
    }
}

