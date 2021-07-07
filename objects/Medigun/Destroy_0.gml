loopsoundstop(MedigunSnd);
if(instance_exists(healTarget))
    if(healTarget.object != -1)
        healTarget.object.healer = -1;

