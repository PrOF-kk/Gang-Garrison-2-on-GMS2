if instance_exists(owner.currentWeapon) {
    owner.currentWeapon.ammoCount -= 1 * global.delta_factor;
    ammoDrained += 1 * global.delta_factor;
}

