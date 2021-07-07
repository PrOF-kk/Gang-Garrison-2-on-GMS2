if (y <= bottom)
    done = true;
if (!done)
    y -= 2 * global.delta_factor;
else
{
    if (alpha > 0.01) 
    {
        alpha -= 0.01 * global.delta_factor;
    }
    if (alpha <= 0.01)
    {
        instance_destroy();
        room_goto_fix(Menu);
    }
}

