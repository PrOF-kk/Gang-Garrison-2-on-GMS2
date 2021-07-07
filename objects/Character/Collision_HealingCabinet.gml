if (!global.mapchanging) {
    if ((hp < maxHp or nutsNBolts < 100 or !canEat) and other.heal)
    {
        if(instance_exists(TeamDeathmatchHUD))
            hp += global.delta_factor/30*10; // 10 hp per second
        else
        {
            playsound(x,y,CbntHealSnd);
            hp = maxHp;
            nutsNBolts = maxNutsNBolts;
            alarm[6] = 0;
            canEat = true; // FIXME: redundant with resetting alarm 6?
        }
    }
    if (burnIntensity > 0 or burnDuration > 0)
    {
        burnIntensity = 0;
        burnDuration = 0;
        burnedBy = -1;
        afterburnSource = -1;
    }
    //ammo stuffs
    if (other.refill) {
        if(currentWeapon.ammoCount < currentWeapon.maxAmmo) {
            switch(currentWeapon.object_index) {
            case Medigun:
            case Minigun:
            case Flamethrower:
            case Blade:
                if (currentWeapon.ammoCount / currentWeapon.maxAmmo < 5/6)
                    playsound(x,y,PickupSnd);
                break;
            default:
                playsound(x,y,PickupSnd);
                break;
            }
            currentWeapon.ammoCount = currentWeapon.maxAmmo;
            switch(currentWeapon.object_index) {
            case Rocketlauncher:
            case Scattergun:
            case Shotgun:
            case Revolver:
            case Medigun:
                with(currentWeapon)
                {
                    if (alarm[5] > 0)
                    {
                        // Stop the animation
                        event_perform(ev_alarm, 5);
                    }
                    alarm[5] = -1;
                }
                break;
            }
        }
    }
    if (other.uber and currentWeapon.object_index == Medigun) {
        if (global.isHost and !currentWeapon.uberReady and !currentWeapon.ubering) {
            sendEventUberReady(player);
            doEventUberReady(player);
        }
    }
}

