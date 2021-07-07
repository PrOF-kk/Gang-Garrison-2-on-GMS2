if(owner.zoomed and readyToShoot)
{
    t += 1 * global.delta_factor;
    if (t > chargeTime)
        t = chargeTime;
}
else
    t = 0;
if(!owner.zoomed)
    hitDamage = unscopedDamage;
else
    hitDamage = baseDamage + floor(sqrt(t/chargeTime)*(maxDamage-baseDamage));

