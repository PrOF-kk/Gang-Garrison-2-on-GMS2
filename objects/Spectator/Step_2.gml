if (global.myself != -1)
    myTeam = global.myself.team;

if(global.myself.object != -1)
    instance_destroy();

var moved;
moved = false;
stopTracking = false;

//moving view - mapped keys
if(!instance_exists(MenuController))
{
    if keyboard_check(global.left) || keyboard_check(global.left2)
    {
        if (x > __view_get( e__VW.WView, 0 )/2)
            x -= 20 * global.delta_factor;
        moved = true;
    }
    else if keyboard_check(global.right) || keyboard_check(global.right2)
    {
        if (x < map_width()-__view_get( e__VW.WView, 0 )/2)
            x += 20 * global.delta_factor;
        moved = true;
    }
    
    if keyboard_check(global.jump) || keyboard_check(global.jump2)
    {
        if (y > __view_get( e__VW.HView, 0 )/2)
            y -= 20 * global.delta_factor;
        moved = true;
    }
    else if keyboard_check(global.down) || keyboard_check(global.down2)
    {
        if (y < map_height()-__view_get( e__VW.HView, 0 )/2)
            y += 20 * global.delta_factor;
        moved = true;
    }
}

if(moved)
{
    afktimer = afktimeout;
    stopTracking = true;
}
else if(tracking)
{
    if (instance_exists(player))
    {
        if(player.team != TEAM_SPECTATOR)
        {
            if(player.object)
            {
                if(!(player.object.cloak && player.team != myTeam))
                {
                    x = round(player.object.x);
                    y = round(player.object.y);
                }
                else
                    stopTracking = true;
            }
        }
        else
            stopTracking = true;
        if (instance_exists(player.corpse) and !player.object and tracking)
        {
            x = round(player.corpse.x);
            y = round(player.corpse.y);
        }
    }
    else
        stopTracking = true;
}

if(tracking and stopTracking) 
{
    tracking = false;
}

// Clip view to map area
// We want a different area depending on whether we're tracking a player or not.
if(!tracking)
{
    x = max(__view_get( e__VW.WView, 0 )/2, min(map_width()-__view_get( e__VW.WView, 0 )/2, x));
    y = max(__view_get( e__VW.HView, 0 )/2, min(map_height()-__view_get( e__VW.HView, 0 )/2, y));
}
else // We're tracking a player, so allow the view to show area from off of the map
{
    x = max(0, min(map_width(), x));
    y = max(0, min(map_height(), y));
}
__view_set( e__VW.XView, 0, x-__view_get( e__VW.WView, 0 )/2 );
__view_set( e__VW.YView, 0, y-__view_get( e__VW.HView, 0 )/2 );

afktimer -= 1 * global.delta_factor;

if((afktimer<=0) and global.isHost==false)
{
    with(Client)
        instance_destroy();

    show_message("You have been disconnected from the server. Reason: AFK");
}

