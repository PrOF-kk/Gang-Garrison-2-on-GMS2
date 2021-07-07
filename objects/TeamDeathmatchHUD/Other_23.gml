receiveCompleteMessage(global.serverSocket,7,global.deserializeBuffer);
global.timeLimitMins = read_ubyte(global.deserializeBuffer);
timeLimit=global.timeLimitMins*30*60;
timer=read_uint(global.deserializeBuffer);
killLimit = read_ushort(global.deserializeBuffer);

