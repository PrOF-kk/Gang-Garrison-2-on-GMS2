if (global.updateType == FULL_UPDATE)
{
    receiveCompleteMessage(global.serverSocket, 6, global.deserializeBuffer);
    redWins = read_ubyte(global.deserializeBuffer);
    blueWins = read_ubyte(global.deserializeBuffer);
    state = read_ubyte(global.deserializeBuffer);
    winners = read_byte(global.deserializeBuffer);
    endCount = read_ushort(global.deserializeBuffer);
}

receiveCompleteMessage(global.serverSocket, 8, global.deserializeBuffer);
global.timeLimitMins = read_ubyte(global.deserializeBuffer);
timeLimit = global.timeLimitMins*30*60;
timer = read_uint(global.deserializeBuffer);
cpUnlock = read_ushort(global.deserializeBuffer);
ArenaControlPoint.locked = cpUnlock > 0;
roundStart = read_ubyte(global.deserializeBuffer)*2;
with (ArenaControlPoint) event_user(13);

