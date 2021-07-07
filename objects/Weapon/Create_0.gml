xoffset += sprite_xoffset;
yoffset += sprite_yoffset;
readyToShoot = false;
justShot = false;
alarm[0] = refireTime / global.delta_factor;

owner = global.paramOwner;
ownerPlayer = global.paramOwner.player;
// 'GW' reward - *G*olden *W*eapon
golden = hasClassReward(ownerPlayer, "GW");

