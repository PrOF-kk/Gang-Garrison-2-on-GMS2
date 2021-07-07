if(global.updateType == FULL_UPDATE) {
    write_byte(global.serializeBuffer, startDirection);
    write_ushort(global.serializeBuffer, round(x*5));
    write_ushort(global.serializeBuffer, round(y*5));
}
if(global.updateType == QUICK_UPDATE or global.updateType == FULL_UPDATE) {
    write_ubyte(global.serializeBuffer, (built != false)*$80 + min(127,hp));
}
if(!built and global.updateType == FULL_UPDATE)
    write_ubyte(global.serializeBuffer, vspeed);



