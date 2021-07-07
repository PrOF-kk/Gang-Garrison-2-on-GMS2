steps += 1;

// Die and fly towards owner
if (owner.object != -1) {
    sprite_index = GhostDeath;
    move_towards_point(owner.object.x, owner.object.y, 10);
// Chase other players but don't stray far from corpse's position
} else {
    var hitBoundary;
    hitBoundary = false;

    if (sprite_index == GhostDeath)
    {
        sprite_index = GhostIdle;
        image_speed = 1/3;
    }

    // Cap distance from corpse
    if (point_distance(origX, origY, x, y) > 128)
    {
        var dir;
        dir = point_direction(origX, origY, x, y);
        x = origX + lengthdir_x(128, dir);
        y = origY + lengthdir_y(128, dir);
        hitBoundary = true;
    }

    // Play animations depending on whether we've hit or not hit boundary
    if (hitBoundary and !hitBoundaryOnLastStep and steps - lastKiss > 90)
    {
        sprite_index = GhostKiss;
        lastKiss = steps;
    }
    if (!hitBoundary and hitBoundaryOnLastStep and steps - lastKiss > 90)
    {
        sprite_index = GhostFlex;
        lastKiss = steps;
    }
    hitBoundaryOnLastStep = hitBoundary;

    // Find closest character
    var closest, closestDist;
    closest = -1;
    closestDist = -1;
    with (Character) {
        var dist;
        dist = point_distance(x, y, other.origX, other.origY);
        if (dist < closestDist or closestDist == -1)
        {
            if (!cloak)
            {
                closest = id;
                closestDist = dist;
            }
        }
    }

    // Stalk them
    if (closest != -1)
    {
        move_towards_point(closest.x, closest.y, 5);
    }
    // Random movement
    else
    {
        nextMoveTicker -= 1;
        if (nextMoveTicker <= 0)
        {
            var randDir;
            randDir = random(360);
            motion_add(randDir, 5);
            nextMoveTicker = irandom(90);
        }
    }
}

// "Friction"
speed = min(speed / 1.125, 15);

// Fade in effect
if (fadeAlpha < 1)
    fadeAlpha += 0.05;

// Face left/right depending on movement
image_xscale = sign(hspeed);

