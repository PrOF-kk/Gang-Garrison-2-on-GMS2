receiveCompleteMessage(global.serverSocket,6,global.deserializeBuffer);
cpUnlock=read_ushort(global.deserializeBuffer);
redTimer=read_ushort(global.deserializeBuffer);
blueTimer=read_ushort(global.deserializeBuffer);
with KothRedControlPoint event_user(13);
with KothBlueControlPoint event_user(13);

