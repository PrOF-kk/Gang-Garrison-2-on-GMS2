if (ammoCount < 0)
    ammoCount = 0;
else if (ammoCount <= maxAmmo and isRefilling)
    ammoCount += 1 * global.delta_factor;
if(!readyToShoot and alarm[5] < (25 / global.delta_factor) and !isRefilling)
    alarm[5] += 1;

