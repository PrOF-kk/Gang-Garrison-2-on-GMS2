maxHp = 140;
baseRunPower = 1.07;
weapons[0] = Blade;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = QuerlyRedS;
    haxxyStatue = QuoteHaxxyStatueS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = QuerlyBlueS;
    haxxyStatue = CurlyHaxxyStatueS;
}

action_inherited();
numFlames = 3;

