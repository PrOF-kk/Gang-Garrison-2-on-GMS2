if(other.team != team) {
    damageSentry(ownerPlayer, other.id, hitDamage);
    other.lastDamageDealer = ownerPlayer;
    other.lastDamageSource = weapon;
    instance_destroy();
}

