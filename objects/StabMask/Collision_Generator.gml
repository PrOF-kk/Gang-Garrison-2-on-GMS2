if (other.team != team)
{
    // Intentionally not doing a line-of-sight check for walls, because
    // map designers might put walls behind the generator
    damageGenerator(ownerPlayer, other.id, hitDamage*0.36);
    
    instance_destroy();
}

