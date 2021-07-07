if(global.updateType == QUICK_UPDATE or global.updateType == FULL_UPDATE) {
    write_ushort(global.serializeBuffer, x_*5);
    write_ushort(global.serializeBuffer, y_*5);
    write_ubyte(global.serializeBuffer, movementState);
}

