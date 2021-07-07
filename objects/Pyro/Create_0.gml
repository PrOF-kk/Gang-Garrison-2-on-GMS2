baseRunPower = 1.1;
maxHp = 120;
weapons[0] = Flamethrower;
haxxyStatue = PyroHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = PyroRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = PyroBlueS;
}

action_inherited();
numFlames = 3;
maxDuration = 10;

