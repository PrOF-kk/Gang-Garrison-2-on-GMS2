if (!global.showHealing or global.myself.object == -1 or global.myself.class != CLASS_MEDIC)
{
    instance_destroy();
    exit;
}

target = noone;
if (instance_exists(global.myself.object.currentWeapon)) {
    target = global.myself.object.currentWeapon.healTarget;
}

