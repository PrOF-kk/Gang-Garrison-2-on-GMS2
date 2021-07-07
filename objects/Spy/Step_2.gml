// Make self invisible if behind enemy
if (bubble.alarm[0] > 0)
    bubble.visible = true;

if (global.myself != -1) if (global.myself.object != -1)
{
    if (team != global.myself.object.team
        and sign(x - global.myself.object.x) == -sign(global.myself.object.image_xscale)
        and !intel
        and global.winners == -1)
    {
        // trigger spy ghost copy if not cloaked
        if (!invisible and (cloakAlpha > 0))
            event_user(7);
        invisible = true;
        bubble.visible = false;
    }
    else
        invisible = false;
}

action_inherited();
