if(not done)
{
    if(alpha < 0.8)
        alpha = power(alpha,
                      power(0.7, global.delta_factor));
    else
        alpha = 0.8;
}
else
{
    if(alpha > 0.01)
        alpha = power(alpha,
                      power(1/0.7, global.delta_factor));
    else
        instance_destroy();
}

