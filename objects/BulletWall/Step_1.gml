open = false;

if (triggerDistance >= 0)
{
    if (distance_to_object(Character) <= triggerDistance)
        open = true;
}

if(open)
    mask_index = emptyMaskS;
else
    mask_index = -1;

