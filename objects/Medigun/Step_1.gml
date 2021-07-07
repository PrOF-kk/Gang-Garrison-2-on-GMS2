if(uberReady)
{
    if(alarm[4] <= 0)
        loopsoundstart(x,y,UberIdleSnd);
    else
        loopsoundmaintain(x,y,UberIdleSnd);
    
    alarm[4] = 2 / global.delta_factor;
}

if(ubering)
{
    owner.ubered = 1;
    owner.alarm[2] = 3 / global.delta_factor;
    uberCharge -= 25/3 * global.delta_factor;
    if(uberCharge <= 0)
    {
        uberCharge = 0;
        ubering = false;
    }
}

