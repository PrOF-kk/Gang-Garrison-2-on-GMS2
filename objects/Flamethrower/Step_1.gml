if (ammoCount < 0)
    ammoCount = 0;
else if (ammoCount <= maxAmmo and isRefilling)
    ammoCount += 1.8 * global.delta_factor;

