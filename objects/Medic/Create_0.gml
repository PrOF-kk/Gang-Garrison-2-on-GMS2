maxHp = 120;
baseRunPower = 1.09;
weapons[0]=Medigun;
haxxyStatue = MedicHaxxyStatueS;

alarm[11] = 30 / global.delta_factor;

if (global.paramPlayer.team == TEAM_RED)
{
    sprite_index = MedicRedS;
}
else if (global.paramPlayer.team == TEAM_BLUE)
{
    sprite_index = MedicBlueS;
}

action_inherited();
numFlames = 4; // 4 instead of the more mathinc 3 in order to make it seem more important that a medic is on fire

