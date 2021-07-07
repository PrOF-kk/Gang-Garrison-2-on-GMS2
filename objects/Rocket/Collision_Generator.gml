{
    if(team != other.team) {
        damageGenerator(ownerPlayer, other.id, hitDamage);
        characterHit = -1;
        event_user(5);
    }
}

