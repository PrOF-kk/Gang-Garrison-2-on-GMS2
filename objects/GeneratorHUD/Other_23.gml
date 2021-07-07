receiveCompleteMessage(global.serverSocket,5,global.deserializeBuffer);
global.timeLimitMins = read_ubyte(global.deserializeBuffer);
timeLimit=global.timeLimitMins*30*60;
timer=read_uint(global.deserializeBuffer);
with GeneratorBlue event_user(13);
with GeneratorRed event_user(13);

