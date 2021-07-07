if(readyToShoot and global.isHost)
{
    var seed;
    seed = irandom(65535);
    sendEventFireWeapon(ownerPlayer, seed);
    doEventFireWeapon(ownerPlayer, seed);
}


