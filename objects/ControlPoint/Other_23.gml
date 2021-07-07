receiveCompleteMessage(global.serverSocket,4,global.deserializeBuffer);
temp = read_byte(global.deserializeBuffer);
cappingTeam = read_byte(global.deserializeBuffer);
capping = read_ushort(global.deserializeBuffer);
if team != temp {
    pointCapture(cp);
    team = temp;
}

