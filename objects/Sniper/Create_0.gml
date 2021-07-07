maxHp = 120;
baseRunPower = 0.9;
weapons[0]=Rifle;
haxxyStatue = SniperHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = SniperRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = SniperBlueS;
}

action_inherited();
numFlames = 4;

