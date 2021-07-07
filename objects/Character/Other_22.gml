{
    var temp;
    write_ubyte(global.serializeBuffer, keyState);
    write_ushort(global.serializeBuffer, netAimDirection);
    write_ubyte(global.serializeBuffer, aimDistance/2);

    if(global.updateType == QUICK_UPDATE or global.updateType == FULL_UPDATE) {
        write_ushort(global.serializeBuffer, x*5);
        write_ushort(global.serializeBuffer, y*5);
        write_byte(global.serializeBuffer, hspeed*8.5);
        write_byte(global.serializeBuffer, vspeed*8.5);
        write_ubyte(global.serializeBuffer, ceil(hp));
        write_ubyte(global.serializeBuffer, currentWeapon.ammoCount);
        
        temp = 0;
        if(cloak) temp |= $01;
        //allocate the next three bits of the byte for movestatus sync
        temp |= (moveStatus & $07) << 1;
        write_ubyte(global.serializeBuffer, temp);               
    }
   

if(global.updateType == FULL_UPDATE){
    write_ubyte(global.serializeBuffer, animationOffset);
    
    //class specific syncs
    switch(player.class)
    {
    case CLASS_SPY:
        write_ubyte(global.serializeBuffer, cloakAlpha*255);
        break;
    case CLASS_MEDIC:
        write_ubyte(global.serializeBuffer, currentWeapon.uberCharge*255/2000);
        break;
    case CLASS_ENGINEER:
        write_ubyte(global.serializeBuffer, nutsNBolts);
        break;
    case CLASS_SNIPER:
        write_ubyte(global.serializeBuffer, currentWeapon.t);
        break;
    default:
        write_ubyte(global.serializeBuffer, 0);
    }
    write_short(global.serializeBuffer, alarm[1]*global.delta_factor);
    write_ubyte(global.serializeBuffer, intel);
    write_short(global.serializeBuffer, intelRecharge);
    
    with(currentWeapon) {
        event_user(12);
    }
    }
}



