alpha += fade;
if(alpha >= 1) {
    fade = -0.05 * global.delta_factor;
} else if(alpha <= 0) {
    fade = 0.05 * global.delta_factor;
}

var arenaRoundEnd;
arenaRoundEnd = false;
if(mode == 2) {
    if(ArenaHUD.state == ArenaHUD.ARENA_STATE_ROUND_END) arenaRoundEnd=true;
} else if (mode == 4) {  
    if (DKothHUD.cpUnlock>0) 
        locked = true; 
    else //bruteforce because the below code won't lock the two edge cases without causing errors in other modes.
    {
        if (cp == 1) { if (global.cp[2].team == TEAM_RED) locked = true else locked = false; }
        if (cp == 2) { if (global.cp[1].team == TEAM_BLUE) locked = true else locked = false; }
    }
} else if (mode != 3){
    // Locking is done externally in Arena mode and KotH
    if(team == TEAM_BLUE) {
        if(cp > 1) {
            if(global.cp[cp-1].team != TEAM_RED) locked = true;
            else locked = false;
        }
    } else if(team == TEAM_RED) {
        if(cp < global.totalControlPoints) {
            if(global.cp[cp+1].team != TEAM_BLUE) locked = true;
            else locked = false;
        }
    }
    
    if(mode==1 && team == TEAM_RED) locked = true;
}

//autolock if the round is over, regardless of game mode
if (arenaRoundEnd || global.mapchanging) locked = true;

if(locked)
{
    capping = 0;
    exit;
}

var randomRedCapper, randomBlueCapper, redCappers, blueCappers, myselfOnPoint, soundx, soundy;
var oldRedPresence, oldBluePresence;

oldRedPresence = redPresence;
oldBluePresence = bluePresence;
redPresence = 0;
bluePresence = 0;
redCappers = 0;
blueCappers = 0;
myselfOnPoint = false;
cappers = 0;

if(not arenaRoundEnd) {
    // At the end of an arena round players on the CP are no longer counted 
    with(Character) {
        if(cappingPoint==other.id) {
            if(player == global.myself) {
                myselfOnPoint = true;
            }
            
            if(player.team == TEAM_RED) {
                if(ubered) {
                    other.redPresence = max(1, other.redPresence);
                } else {
                    other.redPresence = max(2, other.redPresence);
                    redCappers += capStrength;
                }
                randomRedCapper = id;
            } else {
                if(ubered) {
                    other.bluePresence = max(1, other.bluePresence);
                } else {
                    other.bluePresence = max(2, other.bluePresence);
                    blueCappers += capStrength;
                }
                randomBlueCapper = id;
            }
        }
    }
}

var cappingPower, cappingTeamPower;
if(object_index == ArenaControlPoint)
{
    reds = 0;
    blues = 0;
    livereds = 0;
    liveblues = 0;
    
    for(i=0; i<ds_list_size(global.players); i+=1)
    {
        player = ds_list_find_value(global.players, i);
        
        if(player.team == TEAM_RED)
        {
            reds += 1;
            if (player.object != -1 and instance_exists(player.object))
                livereds += 1;
        }
        else if (player.team == TEAM_BLUE)
        {
            blues += 1;
            if (player.object != -1 and instance_exists(player.object))
                liveblues += 1;
        }
    }
    var maxCappingPower;
    maxCappingPower = 4;
    cappingPower[TEAM_BLUE] = max(1,reds)/((1-1/maxCappingPower)*livereds + (1/maxCappingPower)*max(1,reds));
    cappingPower[TEAM_RED] = max(1,blues)/((1-1/maxCappingPower)*liveblues + (1/maxCappingPower)*max(1,blues));
}
else
{
    cappingPower[TEAM_RED] = 1;
    cappingPower[TEAM_BLUE] = 1;
}

if (cappingTeam == TEAM_RED or cappingTeam == TEAM_BLUE)
    cappingTeamPower = cappingPower[cappingTeam]
else
    cappingTeamPower = 1;

// If the player stands on the point all the point sounds should be centered for him.
if(myselfOnPoint) {
    soundx = global.myself.object.x;
    soundy = global.myself.object.y;
} else {
    soundx = x;
    soundy = y;
}

if(redPresence>0 and bluePresence>0) {
    // Both teams have some players on the point...
    if(not (oldRedPresence>0 and oldBluePresence>0)) {
        // ...and the defense happened this step, with the cap meter more than half full
        if(bluePresence>0 and oldBluePresence==0 and team==TEAM_BLUE) {
            var isMe;
            isMe = randomBlueCapper.player == global.myself;
            recordEventInLog(2,TEAM_BLUE, randomBlueCapper.player.name, isMe);
            playsound(soundx, soundy, CPDefendedSnd);
        }
        if(redPresence>0 and oldRedPresence==0 and team==TEAM_RED) {
            var isMe;
            isMe = randomRedCapper.player == global.myself;
            recordEventInLog(2,TEAM_RED, randomRedCapper.player.name, isMe);
            playsound(soundx, soundy, CPDefendedSnd);
        }
    }
} else if(redPresence==0 and bluePresence==0) {
    // Nobody on the point, slowly revert the capture
    if(capping>0) capping=max(capping - cappingTeamPower*global.delta_factor, 0);
} else {
    // Some team has players on an undefended point.
    var teamOnPoint, teamOnPointPresence;
    if(redPresence>0) {
        teamOnPoint = TEAM_RED;
        teamOnPointPresence = redPresence;
        teamOnPointOldPresence = oldRedPresence;
        teamOnPointCappers = redCappers;
    } else {
        teamOnPoint = TEAM_BLUE;
        teamOnPointPresence = bluePresence;
        teamOnPointOldPresence = oldBluePresence;
        teamOnPointCappers = blueCappers;
    }
    
    if (teamOnPointPresence == 1)
    {
        // Only an ubercharged player on the point
        // He can't cap, but he will prevent the point from reverting if his team
        // has partially capped it already
        if (teamOnPoint != cappingTeam)
        {
            capping = max(capping - cappingTeamPower*global.delta_factor, 0);
        }
    }
    else
    {
        // One team has cap-able players on an undefended point...
        if(cappingTeam != -1 and teamOnPoint != cappingTeam)
        {
            // ...but the other team has the point partially captured already, so
            // they have to revert first.
            capping=max(capping - (1+teamOnPointCappers*0.5)*cappingTeamPower*global.delta_factor, 0);
        }
        else if(teamOnPoint != team)
        {
            // ...and the point is not partially capped by the enemy team, and we don't own it already.
            // So let's cap!
            
            if(teamOnPointOldPresence<2 or cappingTeam != teamOnPoint or (oldRedPresence>0 and oldBluePresence>0)) {
                // Play the cap start sound if the team just entered the point,
                // OR we just finished reverting the capture from the other team,
                // OR the point was defended last step.
                playsound(soundx, soundy, CPBeginCapSnd);
            }
            cappingTeam = teamOnPoint;
            cappers = teamOnPointCappers;
            if(cappers<=2) {
                capping += cappers * cappingPower[cappingTeam] * global.delta_factor;
            } else {
                capping += (cappers/2+1) * cappingPower[cappingTeam] * global.delta_factor;
            }
        }
    }
}

if(capping <= 0) {
    capping = 0;
    cappingTeam = -1;
} else if global.isHost {
    if floor(capping) == floor(capTime - capTime/4) || floor(capping) == floor(capTime/4) || floor(capping) == floor(capTime/10){
        GameServer.syncTimer = 1;
    } else if capping >= capTime {
        pointCapture(cp);
        if instance_exists(ControlPointHUD) {
            if ControlPointHUD.mode == 1 ControlPointHUD.timer += 5400;
        }
        GameServer.syncTimer = 1; 
    }
}


