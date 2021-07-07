if(!healedThisStep and instance_exists(healTarget))
{
    if(healTarget.object != -1)
        healTarget.object.healer = -1;
            
    healTarget = noone;
}

healedThisStep = false;

