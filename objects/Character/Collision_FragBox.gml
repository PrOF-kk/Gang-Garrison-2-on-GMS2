playsound(x,y,ExplosionSnd);
hp=0;
if (instance_exists(lastDamageDealer) && lastDamageDealer != player)
    lastDamageSource = DamageSource.FINISHED_OFF_GIB;
else
    lastDamageSource = DamageSource.FRAG_BOX;

