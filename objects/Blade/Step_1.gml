if (replenishing)
    ammoCount = min(max(ammoCount + replenishingRate*global.delta_factor, 0), maxAmmo);

