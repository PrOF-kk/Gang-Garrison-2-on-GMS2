maxHp = 100;
baseRunPower = 1.08;
weapons[0]=Revolver;
haxxyStatue = SpyHaxxyStatueS;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = SpyRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = SpyBlueS;
}

action_inherited();
// Override defaults
canCloak = 1;
numFlames = 4;

