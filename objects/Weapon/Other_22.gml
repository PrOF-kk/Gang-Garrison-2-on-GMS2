{
    write_ubyte(global.serializeBuffer, readyToShoot);
    write_ubyte(global.serializeBuffer, alarm[0]*global.delta_factor);    
}

