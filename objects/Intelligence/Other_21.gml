receiveCompleteMessage(global.serverSocket, 6, global.deserializeBuffer);
x = read_ushort(global.deserializeBuffer)/5;
y = read_ushort(global.deserializeBuffer)/5;
alarm[0] = read_short(global.deserializeBuffer)/global.delta_factor;

