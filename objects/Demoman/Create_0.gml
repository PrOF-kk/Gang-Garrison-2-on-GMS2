maxHp = 120;
baseRunPower = 1;
weapons[0] = Minegun;
haxxyStatue = DemomanHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = DemomanRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = DemomanBlueS;
}

action_inherited();
numFlames = 3;

