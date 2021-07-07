playsound(x,y,ExplosionSnd);
hp=0;
if (instance_exists(lastDamageDealer) && lastDamageDealer != player)
    lastDamageSource = DAMAGE_SOURCE_FINISHED_OFF_GIB;
else
    lastDamageSource = DAMAGE_SOURCE_FRAG_BOX;

