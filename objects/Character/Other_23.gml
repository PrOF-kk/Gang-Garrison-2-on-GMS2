{
    receiveCompleteMessage(global.serverSocket,4,global.deserializeBuffer);
    keyState = read_ubyte(global.deserializeBuffer);
    aimDirection = read_ushort(global.deserializeBuffer)*360/65536;
    aimDistance = read_ubyte(global.deserializeBuffer)*2;
    
    var temp, newIntel;
    if(global.updateType == QUICK_UPDATE) or (global.updateType == FULL_UPDATE) {
        receiveCompleteMessage(global.serverSocket,9,global.deserializeBuffer);
        x = read_ushort(global.deserializeBuffer)/5;
        y = read_ushort(global.deserializeBuffer)/5;
        hspeed = read_byte(global.deserializeBuffer)/8.5;
        vspeed = read_byte(global.deserializeBuffer)/8.5;
        xprevious = x;
        yprevious = y;
        
        hp = read_ubyte(global.deserializeBuffer);
        currentWeapon.ammoCount = read_ubyte(global.deserializeBuffer);
        
        temp = read_ubyte(global.deserializeBuffer);
        cloak = (temp & $01 != 0);
        moveStatus = (temp >> 1) & $07;
    }
    
if(global.updateType == FULL_UPDATE){
        receiveCompleteMessage(global.serverSocket,7,global.deserializeBuffer);
        animationOffset = read_ubyte(global.deserializeBuffer);
        //class specific syncs
        switch(player.class)
        {
        case CLASS_SPY:
            cloakAlpha = read_ubyte(global.deserializeBuffer)/255;
            break;
        case CLASS_MEDIC:
            currentWeapon.uberCharge = read_ubyte(global.deserializeBuffer)*2000/255;
            break;
        case CLASS_ENGINEER:
            nutsNBolts = read_ubyte(global.deserializeBuffer);
            break;
        case CLASS_SNIPER:
            currentWeapon.t = read_ubyte(global.deserializeBuffer);
            if(currentWeapon.t) zoomed = true; // Quick hack
            break;
        default:
            read_ubyte(global.deserializeBuffer)
        }
        alarm[1] = read_short(global.deserializeBuffer)/global.delta_factor; 
        if (alarm[1] != 0)
            canGrabIntel = false;
        intel = read_ubyte(global.deserializeBuffer);
        intelRecharge = read_short(global.deserializeBuffer);
        with(currentWeapon) {
            event_user(13);
        }
    }
    event_user(1);
}



