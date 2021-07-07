gunSetSolids();
if (!place_free(x, y)) 
{
    instance_destroy();
    gunUnsetSolids();
    exit;
}
gunUnsetSolids();
if(other.team != team) {
    damageSentry(ownerPlayer, other.id, hitDamage);
    other.lastDamageDealer = ownerPlayer;
    other.lastDamageSource = weapon;
    instance_destroy();
}

