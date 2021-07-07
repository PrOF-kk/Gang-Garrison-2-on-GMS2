hp=0;
if (instance_exists(lastDamageDealer) && lastDamageDealer != player)
    lastDamageSource = DAMAGE_SOURCE_FINISHED_OFF;
else
    lastDamageSource = DAMAGE_SOURCE_KILL_BOX;

