if(global.updateType == QUICK_UPDATE) or (global.updateType == FULL_UPDATE) {
    receiveCompleteMessage(global.serverSocket,5,global.deserializeBuffer);
    x_ = read_ushort(global.deserializeBuffer)/5;
    y_ = read_ushort(global.deserializeBuffer)/5;
    movementState = read_ubyte(global.deserializeBuffer);
    x = round(x_);
    y = round(y_);
}

