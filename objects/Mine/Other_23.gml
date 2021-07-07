if(global.updateType == QUICK_UPDATE or global.updateType == FULL_UPDATE) {
    receiveCompleteMessage(global.serverSocket, 7, global.deserializeBuffer);

    x = read_ushort(global.deserializeBuffer)/5;
    y = read_ushort(global.deserializeBuffer)/5;
    hspeed = read_byte(global.deserializeBuffer)/5;
    vspeed = read_byte(global.deserializeBuffer)/5;
    stickied = read_ubyte(global.deserializeBuffer);
}

