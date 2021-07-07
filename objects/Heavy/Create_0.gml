baseRunPower = 0.8;
maxHp = 200;
weapons[0] = Minigun;
haxxyStatue = HeavyHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = HeavyRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = HeavyBlueS;
}

action_inherited();
numFlames = 5;

