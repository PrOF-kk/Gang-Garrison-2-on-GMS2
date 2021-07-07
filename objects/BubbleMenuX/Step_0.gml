if(not done) {
    if(alpha<0.99) alpha = power(alpha,power(0.7, global.delta_factor));
    else alpha = 0.99;
    if x < 31 x+=15 * global.delta_factor;
    if x > 31 x=31;
    }
else {
    if(alpha>0.01) alpha = power(alpha,power(1/0.7, global.delta_factor));
    x-=15 * global.delta_factor;
    if x <=-62 instance_destroy();
    }

