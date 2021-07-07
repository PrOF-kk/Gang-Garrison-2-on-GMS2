baseRunPower = 1.4;
maxHp = 100;
weapons[0] = Scattergun;
haxxyStatue = ScoutHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = ScoutRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = ScoutBlueS;
}

action_inherited();
// Override defaults
capStrength = 2;
canDoublejump = 1;
numFlames = 3;

