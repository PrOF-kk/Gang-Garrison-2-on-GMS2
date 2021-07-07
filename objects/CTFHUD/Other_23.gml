receiveCompleteMessage(global.serverSocket,5,global.deserializeBuffer);
global.timeLimitMins = read_ubyte(global.deserializeBuffer);
timeLimit=global.timeLimitMins*30*60;
timer=read_uint(global.deserializeBuffer);


