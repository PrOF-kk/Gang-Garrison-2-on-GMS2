if(not done) {
    if(alpha<0.8) alpha = power(alpha,0.7);
    else alpha = 0.8;
    }
else {
    if(alpha>0.01) alpha = power(alpha,1/0.7);
    else instance_destroy();
    }
