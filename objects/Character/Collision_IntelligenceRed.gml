// Intelligence grabbing is synced now, so it's only tested on the server
if(global.isHost and !global.mapchanging and !instance_exists(InvasionHUD))
{
    if(team == TEAM_BLUE and !place_meeting(x,y,TeamGate) and (canGrabIntel or other.alarm[0] <= 1) and !ubered and !cloak)
    {
        sendEventGrabIntel(player);
        doEventGrabIntel(player);
    }
}

