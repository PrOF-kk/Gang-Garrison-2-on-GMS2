write_ubyte(global.serializeBuffer, global.timeLimitMins);
write_uint(global.serializeBuffer, timer);
write_ushort(global.serializeBuffer, global.setupTimer);
for(i=1; i<=global.totalControlPoints; i+=1) {
    with global.cp[i] event_user(12);
}


