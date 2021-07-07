charSetSolids();

// Limit speed to prevent obstacle penetration
// (each dimension separately to avoid one vector affecting the other)
hspeed = min(abs(hspeed), 15) * sign(hspeed);
vspeed = min(abs(vspeed), 15) * sign(vspeed);

// Pretty sure this is for the healing ramp (crit heals)
// Done here instead of begin step to avoid code execution order mistakes
timeUnscathed = min(timeUnscathed+1*global.delta_factor, 10*30);

// Spinjumping emulation
if(global.run_virtual_ticks)
{
    if (sign(hspeed) > 0) // See if we're "spinning", also mirror which side gets the boost so that the effect of spinjumping is perfectly symmetric
        _test = _last_xscale > image_xscale;
    else
        _test = _last_xscale < image_xscale;


    if (_test and !place_free(x+sign(hspeed), y)) // Rubbing wall and spinning
        spinjumping = true;
    else
        spinjumping = false;


    _last_xscale = image_xscale;
}

if(moveStatus == 1 or moveStatus == 2 or moveStatus == 4) // Make an anti-gravity for what our physics gravity should be (at 30fps)
    _gravity = 0.54;
else
    _gravity = 0.6;

if (spinjumping and
    place_free(x, y-_gravity) // validity check
    and (place_free(x, y+1) or vspeed < 0) // In air, or jumping
   )
    applied_gravity -= _gravity;
else
    spinjumping = false; // prevent phantom spinjump dust

// The change in vspeed for gravity for DURATION of this frame (not the end of it!) is half the change there is by the end of it (see?)
// See gravity comments in Begin Step for rationale.
vspeed += applied_gravity*global.delta_factor/2;
if(vspeed > 10)
    vspeed = 10;

// Run movement solver if necessary
yprevious = y;
xprevious = x;
y_previous = y;
x_previous = x;

var doHit;
doHit = !place_free(x+hspeed*global.delta_factor, y+vspeed*global.delta_factor);

if(doHit)
{
    characterHitObstacle();
}
else
{
    x += hspeed * global.delta_factor;
    y += vspeed * global.delta_factor;
}

// Fallback
if(place_free(x, y+1))
    vspeed += applied_gravity*global.delta_factor/2;
if(vspeed > 10)
    vspeed = 10;
applied_gravity = 0;

// Handle dropdown platforms
if(!(keyState & $02))
{
    with(DropdownPlatform)
    {
        if(other.y < other.y_previous) continue;
        if(!place_meeting(x, y, other)) continue;
        if(place_meeting(x, y + (other.y - other.y_previous), other)) continue;
    
        with(other)
        {
            while(place_meeting(x, y, other) and place_free(x, y - 0.1))
                y -= 0.1;
            vspeed = 0;
        }
    }
}

x -= hspeed;
y -= vspeed;

charUnsetSolids();

