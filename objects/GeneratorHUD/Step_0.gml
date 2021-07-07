if timer > 0
    timer -= 1 * global.delta_factor;
else if (timer <= 0 and instance_exists(GeneratorRed) and instance_exists(GeneratorBlue))
{
    var redStage, blueStage;
    with (Generator)
    {
        if (hp >= maxHp*0.66)
        {
            if (team == TEAM_RED) 
                redStage = 3 
            else blueStage = 3;
        }
        else if (hp >= maxHp*0.33 && hp < maxHp*0.66)
        {
            if (team == TEAM_RED)
                redStage = 2;
            else blueStage = 2;
        }
        else
        {
            if (team == TEAM_RED)
                redStage = 1;
            else blueStage = 1;
        }
    }
    if (redStage > blueStage && GeneratorRed.alarm[0] > -1) { overtime = true; exit; }
    if (redStage < blueStage && GeneratorBlue.alarm[0] > -1) { overtime = true; exit; }
    if (redStage == blueStage && (GeneratorRed.alarm[0] > -1 || GeneratorBlue.alarm[0] > -1)) { overtime = true; exit; }    
    if (redStage > blueStage) global.winners = TEAM_RED;
    if (redStage < blueStage) global.winners = TEAM_BLUE;
    if (redStage == blueStage) global.winners = TEAM_SPECTATOR;
}

