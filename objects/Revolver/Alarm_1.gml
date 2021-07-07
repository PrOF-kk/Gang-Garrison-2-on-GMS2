{ 
        shot = instance_create(x,y,StabMask);
        shot.direction=stabdirection;
        shot.speed=0;
        shot.owner=owner;
        shot.ownerPlayer=ownerPlayer;
        shot.team=owner.team;
        shot.hitDamage = 200;
        shot.weapon=DamageSource.KNIFE;
}

action_set_alarm(18, 2);
