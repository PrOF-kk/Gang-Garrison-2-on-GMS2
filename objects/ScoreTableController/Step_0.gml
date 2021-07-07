if (done and !global.fadeScoreboard)
    instance_destroy();
else if (!done and alpha < 1)
    alpha = min(1, power(alpha,power(0.5, global.delta_factor))+0.05);
else if (done and alpha > 0)
    alpha = max(0, power(alpha,power(2, global.delta_factor))-0.05);
else if (done and alpha < 1/256)
    instance_destroy();


