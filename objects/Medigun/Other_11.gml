{
    if(!instance_exists(healTarget) and readyToShoot)
    {
        var bestTarget, bestScore, mouseX, mouseY, aimRayEndX, aimRayEndY;
        bestTarget = noone;
        bestScore = 0;
        
        // Reconstructed mouse position of owner
        mouseX = owner.x + lengthdir_x(owner.aimDistance, owner.aimDirection);
        mouseY = owner.y + lengthdir_y(owner.aimDistance, owner.aimDirection);
        
        // The healer must be aiming at the new heal target to connect. This means
        // the heal target must touch the line from the medigun to the aimRayEnd.
        aimRayEndX = owner.x + lengthdir_x(maxHealDistance, owner.aimDirection);
        aimRayEndY = owner.y + lengthdir_y(maxHealDistance, owner.aimDirection);

        with(Character)
        {
            if(id == other.owner or team != other.owner.team)
                continue;
                
            var healDistance, mouseDistance, targetScore;
            healDistance = point_distance(x, y, other.x, other.y);
            mouseDistance = point_distance(x, y, mouseX, mouseY);
            
            if(healDistance > other.maxHealDistance)
                continue;
                
            if(mouseDistance <= other.maxMouseSelectDistance)
            {
                // Character is in mouse range, so we give it a high score (between 2 and 3). Closer to mouse -> higher score.
                targetScore = 3 - mouseDistance / other.maxMouseSelectDistance; // Mouse distance 0: score 3. Max mouse distance: score 2.
            }
            else
            {
                // Character is not in mouse range, so we give it a low score (between 0 and 1). Closer to healer -> higher score.
                targetScore = 1 - healDistance / other.maxHealDistance; // Heal distance 0: score 1. Heal distance maxHealDistance: score 0.
            }
            
            if(targetScore < bestScore)
                continue;   // We already found a better match
            
            if(!collision_line(other.x, other.y, aimRayEndX, aimRayEndY, id, true, false))
                continue;   // We are not aiming at this character
            
            if(collision_line(other.x, other.y, x, y, Obstacle, true, true))
                continue;   // There is something in the way
            
            bestTarget = player;
            bestScore = targetScore;
        }

        healTarget = bestTarget;
        readyToShoot = false;
        alarm[0] = 1 / global.delta_factor;
    }
    
    if(instance_exists(healTarget)) {
        if(healTarget.object != -1) {
            if(point_distance(x,y,healTarget.object.x, healTarget.object.y)<=maxHealDistance) {
                if(collision_line(x,y, healTarget.object.x, healTarget.object.y, Obstacle, true, true)<0) {
                    healedThisStep = true;
                    
                    if (healTarget.object.healer == -1)
                        healTarget.object.healer = ownerPlayer;
                    if (healTarget.object.burnDuration > 0)
                        healTarget.object.burnDuration -= 1 * global.delta_factor;
                    var healthGained;
                    healthGained = healAmount * calculateHealingFactor(healTarget.object.timeUnscathed);
                    if(healTarget.object.hp > healTierHealth)
                        healthGained *= healTierAmount;
                    healTarget.object.hp = min(healTarget.object.hp + healthGained * global.delta_factor, healTarget.object.maxHp);
                    hphealed += healthGained * global.delta_factor;
                    ownerPlayer.stats[HEALING] += healthGained * global.delta_factor;
                    ownerPlayer.roundStats[HEALING] += healthGained * global.delta_factor;
                    
                    
                    if(ubering == false && uberCharge<2000){
                        var setup;
                        setup = false;
                        if(instance_exists(ControlPointSetupGate)) {
                            if (areSetupGatesClosed())
                                setup = true;
                        }
                        if(healTarget.object.hp < healTarget.object.maxHp or setup)
                            uberCharge += 2.5 * global.delta_factor;
                        else
                            uberCharge += 1.75 * global.delta_factor;
                        if(uberCharge >= 2000) 
                        {
                            uberCharge = 2000;
                            if(global.isHost)
                            {
                                sendEventUberReady(ownerPlayer);
                                doEventUberReady(ownerPlayer);
                            }
                        }
                    } else if(ubering == true){
                        if healTarget.object.ubered == 0 playsound(x,y,UberStartSnd);
                        healTarget.object.ubered = 1;
                        healTarget.object.alarm[2] = 3 / global.delta_factor; 
                    }
                                                               
                    if hphealed >= HP_PER_POINT {
                        ownerPlayer.stats[POINTS] += 1;
                        ownerPlayer.roundStats[POINTS] += 1;
                        hphealed -= HP_PER_POINT;
                    }

                    if(alarm[3] <= 0) {
                        loopsoundstart(x,y,MedigunSnd);
                    } else {
                        loopsoundmaintain(x,y,MedigunSnd);
                    }
                    alarm[3] = 2 / global.delta_factor;
                } else {
                    healTarget.object.healer = -1;
                    healTarget = noone;
                }
            } else {
                healTarget.object.healer = -1;
                healTarget = noone;
            }
        } else {
            healTarget = noone;
        }
    }
}

