var dx, dy, direction_, speed_;

if(movementState == 1)
{
    speed_ = upSpeed;
    direction_ = point_direction(0, 0, left, -top);
    image_index += animationSpeed * global.delta_factor;
}
else if(movementState == 2)
{
    speed_ = downSpeed;
    direction_ = point_direction(left, -top, 0, 0);
    image_index += animationSpeed * global.delta_factor;
}
else
{
    speed_ = 0;
    direction_ = 0;
    image_index = 0;
}

dx = cos(degtorad(direction_)) * speed_ * global.delta_factor;
dy = -sin(degtorad(direction_)) * speed_ * global.delta_factor;

x_ += dx;
y_ += dy;

var totalDist;
// Distance of the platform from (startX, startY) in the "topwards" direction
totalDist = point_distance(0, 0, left, -top);
if (totalDist <= 0) {
    movementState = 0;
    x_ = startX;
    y_ = startY;
}
else {
    var dist;
    // (which is the vector (left, -top))
    dist = ((x_-startX)*left + (y_-startY)*(-top)) / totalDist;
    if((movementState == 2) and (dist <= 0))
    {
        x_ = startX;
        y_ = startY;
        if(trigger == 0)
            movementState = 1;
        else
            movementState = 0;
    }
    else if((movementState == 1) and (dist >= totalDist))
    {
        movementState = 2;
    }
}

var colldx, colldy;
colldy = round(y_) - round(y);
colldx = round(x_) - round(x);

if(colldx != 0 or colldy != 0 or (movementState == 0 and trigger > 0))
{
    with(Character)
    {
        if(keyState & $02) continue; // Cannot collide or move along if they hold "down"
        // This condition should allow people to be picked up by the platform as long as they don't move
        // upwards, or move upward less quickly than the platform. Note that you *need* the two part condition - just
        // checking for upward motion would let an up-moving platform pass right through someone moving up less quickly,
        // and just comparing vspeeds would prevent people from standing on the platform and being moved down by it.
        if((vspeed < 0) and ((vspeed * global.delta_factor) < dy)) continue; // Don't pick up characters who are just "passing through"
        if(place_meeting(x, y, other)) continue;
        if(place_meeting(x, y+1, other))
        {
            // Character is standing on this dropdown, move them accordingly unless they would get stuck
            charSetSolids();
            if(place_free(x+colldx, y+colldy))
            {
                x += colldx;
                y += colldy;
                vspeed = 0;
            }
            charUnsetSolids();
            
            if (other.movementState == 0 and (other.trigger == 1 or (other.trigger == 2 and intel)))
            {
                other.movementState = 1;
            }
        }
        else if(place_meeting(x-colldx, y-colldy, other.id))
        {
            // Not standing on the platform, but the platform runs into this character.
            // However, does it do so from the bottom?
            var oldCharX, oldCharY, charMoved;
            oldCharX = x;
            oldCharY = y;
            charMoved = false;
            other.solid = true;
            good_move_contact_solid(point_direction(x, y, x-colldx, y-colldy), point_distance(x, y, x-colldx, y-colldy));
            other.solid = false;
            if(place_meeting(x, y+1, other))
            {
                // Yes, the platform runs into the character from the bottom
                charSetSolids();
                if(place_free(x + colldx, y + colldy))
                {
                    x += colldx;
                    y += colldy;
                    vspeed = 0;
                    charMoved = true;
                }
                charUnsetSolids();
            }
            if(not charMoved)
            {
                x = oldCharX;
                y = oldCharY;
            }
        }
    }
    x = round(x_);
    y = round(y_);
}

