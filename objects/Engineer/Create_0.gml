maxHp = 120;
baseRunPower = 1;
weapons[0]=Shotgun;
haxxyStatue = EngineerHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = EngineerRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = EngineerBlueS;
}

action_inherited();
// Override defaults
numFlames = 3;

