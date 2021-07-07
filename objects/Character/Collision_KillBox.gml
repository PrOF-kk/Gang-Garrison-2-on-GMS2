hp=0;
if (instance_exists(lastDamageDealer) && lastDamageDealer != player)
    lastDamageSource = DamageSource.FINISHED_OFF;
else
    lastDamageSource = DamageSource.KILL_BOX;

