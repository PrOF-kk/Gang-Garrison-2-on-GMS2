baseRunPower = .9;
maxHp = 160;
weapons[0] = Rocketlauncher;
haxxyStatue = SoldierHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = SoldierRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = SoldierBlueS;
}

action_inherited();
numFlames = 4;

