owner.currentWeapon.bladesOut -= 1;
if (ammoDrained < owner.currentWeapon.refireTime) 
    owner.currentWeapon.ammoCount -= owner.currentWeapon.refireTime - ammoDrained;

