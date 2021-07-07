{
    if (readyToShoot and !instance_exists(healTarget) and !ubering and ammoCount > 0)
    {
        ammoCount -= 1;
        playsound(x,y,MedichaingunSnd);
        var shot;
        shot = createShot(x, y + yoffset + 1, Needle, DAMAGE_SOURCE_NEEDLEGUN, owner.aimDirection, 7+random(3));
        shot.hitDamage = 4;
        justShot=true;
        with(shot)
            hspeed+=owner.hspeed;
        readyToShoot=false;
        alarm[0] = refireTime / global.delta_factor;
        alarm[5] = (reloadBuffer + reloadTime) / global.delta_factor;
        alarm[7] = alarm[5] / 4;
    }
    else if (uberReady && (owner.keyState & $10))
    {
        if(global.isHost)
        {
            sendEventUber(ownerPlayer);
            doEventUber(ownerPlayer);
        }
    }
}

