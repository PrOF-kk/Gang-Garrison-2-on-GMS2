if (instance_exists(ArenaControlPoint))
    cp = ArenaControlPoint.id;
else
    cp = instance_nearest(x,y,ControlPoint);

