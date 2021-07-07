if(global.updateType == QUICK_UPDATE or global.updateType == FULL_UPDATE) {
    write_ushort(global.serializeBuffer, round(x*5));
    write_ushort(global.serializeBuffer, round(y*5));
    write_byte(global.serializeBuffer, round(hspeed*5));
    write_byte(global.serializeBuffer, round(vspeed*5));
    write_ubyte(global.serializeBuffer, stickied);
}

