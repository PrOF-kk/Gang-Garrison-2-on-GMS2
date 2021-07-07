afktimeout=9000;
afktimer=afktimeout;
//checkpoint system for each keypad #
//2 arrays keeps track of the x, y locations that each keypad # has saved.
for (i=0; i<=9; i+=1;) {
    savex_view[i]=-1;
    savey_view[i]=-1;
}
//variables for tracking a specific player
tracking=false;
track_id=0;
player = noone;

numpadKeys[0] = vk_numpad0;
numpadKeys[1] = vk_numpad1;
numpadKeys[2] = vk_numpad2;
numpadKeys[3] = vk_numpad3;
numpadKeys[4] = vk_numpad4;
numpadKeys[5] = vk_numpad5;
numpadKeys[6] = vk_numpad6;
numpadKeys[7] = vk_numpad7;
numpadKeys[8] = vk_numpad8;
numpadKeys[9] = vk_numpad9;

// deals with problem of global.myself not existing prior to deserialisation
myTeam = TEAM_SPECTATOR;
if (global.myself != -1)
{
    myTeam = global.myself.team;
} 

// only auto-track if not on a team
if (myTeam == TEAM_SPECTATOR)
{
    event_user(7);
}
else
{
    tracking=true;
    player = global.myself;
}
// so you can actually see the initial tracking
// back up keyboard string because io_clear clears it
var _keyboard_string;
_keyboard_string = keyboard_string;
io_clear();
keyboard_string = _keyboard_string;

