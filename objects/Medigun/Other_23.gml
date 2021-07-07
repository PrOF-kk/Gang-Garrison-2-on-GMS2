var healTargetId;

receiveCompleteMessage(global.serverSocket, 1, global.deserializeBuffer);
healTargetId = read_ubyte(global.deserializeBuffer);
if(healTargetId != 255) {
    healTarget = ds_list_find_value(global.players, healTargetId);
} else {
    healTarget = noone;
}


