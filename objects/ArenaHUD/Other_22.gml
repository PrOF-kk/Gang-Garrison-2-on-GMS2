if (global.updateType == FULL_UPDATE)
{
    write_ubyte(global.serializeBuffer, redWins);
    write_ubyte(global.serializeBuffer, blueWins);
    write_ubyte(global.serializeBuffer, state);
    write_byte(global.serializeBuffer, winners);
    write_ushort(global.serializeBuffer, endCount);
}

write_ubyte(global.serializeBuffer, global.timeLimitMins);
write_uint(global.serializeBuffer, timer);
write_ushort(global.serializeBuffer, cpUnlock);
write_ubyte(global.serializeBuffer, floor(roundStart/2));
with (ArenaControlPoint) event_user(12);

