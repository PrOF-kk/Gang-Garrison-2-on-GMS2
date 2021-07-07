if(readyToShoot and ammoCount >0 and lobbed<maxMines and global.isHost)
{
    var seed;
    seed = irandom(65535);
    sendEventFireWeapon(ownerPlayer, seed);
    doEventFireWeapon(ownerPlayer, seed);
}


