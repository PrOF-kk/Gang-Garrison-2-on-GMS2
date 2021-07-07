var imp;
imp = instance_create(x,y,Impact);
// Make the impact effect occur in the general direction of the stab, far enough from the spy to be noticable
imp.x += sign(cos(degtorad(direction)))*15;
imp.y -= 12;
imp.image_angle = direction;

