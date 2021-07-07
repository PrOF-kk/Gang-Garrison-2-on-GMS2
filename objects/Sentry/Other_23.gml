if(global.updateType == FULL_UPDATE) {
    receiveCompleteMessage(global.serverSocket, 5, global.deserializeBuffer);
    startDirection = read_byte(global.deserializeBuffer);
    x = read_ushort(global.deserializeBuffer)/5;
    y = read_ushort(global.deserializeBuffer)/5;
    xprevious = x;
    yprevious = y;
}
if(global.updateType == QUICK_UPDATE or global.updateType == FULL_UPDATE) {
    receiveCompleteMessage(global.serverSocket, 1, global.deserializeBuffer);
    var tbyte;
    tbyte = read_ubyte(global.deserializeBuffer);
    built = (tbyte & $80) != false;
    hp = tbyte & $7F;
    if(global.updateType == FULL_UPDATE and !built)
    {
        receiveCompleteMessage(global.serverSocket, 1, global.deserializeBuffer);
        vspeed = read_ubyte(global.deserializeBuffer);
    }
    if(built)
    {
        vspeed = 0;
    }
}

