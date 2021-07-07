if(global.isHost and hp<=0)
{
    var healer;
    healer = noone;
    with(lastDamageDealer)
        if (object)
            if (object.healer)
                healer = object.healer;
    sendEventDestruction(ownerPlayer, lastDamageDealer, healer, lastDamageSource);
    doEventDestruction(ownerPlayer, lastDamageDealer, healer, lastDamageSource);
    exit;
}
if(hp>maxHp) hp=maxHp;

if (built == 1) {
    if (idleTimer == true) {
        playsound(x,y,SentryIdle);
        alarm[5] = 90 / global.delta_factor;    
    }    
    idleTimer = false;
}

