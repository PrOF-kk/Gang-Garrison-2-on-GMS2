receiveCompleteMessage(global.serverSocket,6,global.deserializeBuffer);
cpUnlock=read_ushort(global.deserializeBuffer);
redTimer=read_ushort(global.deserializeBuffer);
blueTimer=read_ushort(global.deserializeBuffer);
with KothControlPoint event_user(13);
if cpUnlock == 0 && KothControlPoint.locked {
    doEventUnlockCP();
}

