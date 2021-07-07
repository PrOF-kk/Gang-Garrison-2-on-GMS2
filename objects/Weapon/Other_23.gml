{
    receiveCompleteMessage(global.serverSocket, 2, global.deserializeBuffer);
    readyToShoot = read_ubyte(global.deserializeBuffer);
    alarm[0] = read_ubyte(global.deserializeBuffer)/global.delta_factor;    
}

