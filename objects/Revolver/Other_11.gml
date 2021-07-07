if(readyToShoot && !owner.cloak && ammoCount > 0)
{
    if(global.isHost)
    {
        var seed;
        seed = irandom(65535);
        sendEventFireWeapon(ownerPlayer, seed);
        doEventFireWeapon(ownerPlayer, seed);
    }
}
else if(readyToStab && owner.cloak && !(owner.keyState & $08))
{
    owner.runPower = 0;
    owner.jumpStrength = 0;
    owner.stabbing = 1;
    
    stabdirection = owner.aimDirection;
    stab = instance_create(x,y,StabAnim);
    stab.direction = owner.aimDirection;
    stab.speed = 0;
    stab.owner = owner;
    stab.ownerPlayer = ownerPlayer;
    stab.team = owner.team;
    stab.hitDamage = 0;
    stab.weapon = DamageSource.KNIFE;
    stab.golden = golden;
    
    // 'BH' reward - *B*obble *H*ead
    if(hasClassReward(ownerPlayer, "BH"))
    {
        ds_list_add(stab.overlays, HatBobbleSpyStabS);
    }
    readyToStab = false;
    alarm[1] = StabreloadTime / global.delta_factor;
}

