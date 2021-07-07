{  
    if(characterHit.id != ownerPlayer.object)
    {
        if(exploded)
            exit;
        else
            exploded = true;
        if(characterHit != -1) {
            if(characterHit.team != team || characterHit.id == ownerPlayer.object and !characterHit.ubered )
            {
                damageAuto( ownerPlayer, characterHit, hitDamage );
                if object_is_ancestor(characterHit.object_index, Character)
                {
                    if (characterHit.lastDamageDealer != ownerPlayer and characterHit.lastDamageDealer != characterHit.player)
                    {
                        characterHit.secondToLastDamageDealer = characterHit.lastDamageDealer;
                        characterHit.alarm[4] = characterHit.alarm[3]
                    }
                    characterHit.alarm[3] = ASSIST_TIME / global.delta_factor;
                }
                characterHit.lastDamageDealer = ownerPlayer;
                characterHit.lastDamageSource = weapon;
            }
        }
        instance_create(x,y,Explosion);
        playsound(x,y,ExplosionSnd);
        
        with (Character) {
            if (distance_to_object(other) < other.blastRadius and !(team == other.team and id != other.ownerPlayer.object and place_meeting(x, y+1, Obstacle))){
                var rdir, vectorfactor;
                rdir = point_direction(other.x, other.y, x+(left_bound_offset+right_bound_offset)/2, y+(top_bound_offset+bottom_bound_offset)/2);
                vectorfactor = point_distance(0, 0, power(sin(degtorad(rdir)), 2), power(cos(degtorad(rdir)), 2));
                var fake_distance;
                fake_distance = distance_to_object(other);
                if(fake_distance < 1) fake_distance = 0; // fix distance of rockets to players that they collide with, now that it's handled properly
                if (1 - fake_distance/other.blastRadius <= 0.25)
                    continue;
                motion_add(rdir, min(15, other.knockback-other.knockback*(fake_distance/other.blastRadius)) * vectorfactor);
                if(!ubered and hp > 0)
                {
                    if (other.team != team) or (id==other.ownerPlayer.object)
                    {
                        damageCharacter( other.ownerPlayer, id, other.explosionDamage*(1-(fake_distance/other.blastRadius)) );
                        
                        if(id == other.ownerPlayer.object and instance_exists(lastDamageDealer) and lastDamageDealer != other.ownerPlayer)
                            lastDamageSource = DamageSource.FINISHED_OFF_GIB;
                        else 
                        {
                            if (lastDamageDealer != other.ownerPlayer && lastDamageDealer != player){
                                secondToLastDamageDealer = lastDamageDealer;
                                alarm[4] = alarm[3]
                            }
                            if (other.ownerPlayer != id)
                                alarm[3] = ASSIST_TIME / global.delta_factor;
                            lastDamageDealer = other.ownerPlayer;
                            lastDamageSource = other.weapon;
                        }
                        dealFlicker(id);
                    }
                    if id==other.ownerPlayer.object and other.team == team {
                        moveStatus = 1;
                        speed*=1.06;
                    }else if other.team == team and (id!=other.ownerPlayer.object){
                        moveStatus = 4;
                            if point_direction(x,y+5,other.x,other.y-5)>210 and point_direction(x,y,other.x,other.y)<330 {
                            vspeed-=4*(1-(fake_distance/other.blastRadius));
                            speed*=1.3;
                        }
                    } else {
                        moveStatus = 2;
                        if point_direction(x,y+5,other.x,other.y-5)>210 and point_direction(x,y,other.x,other.y)<330 {
                            vspeed-=4*(1-(fake_distance/other.blastRadius));
                            speed*=1.3;
                        }
                    }
                    if(global.gibLevel > 0) {
                        if (id==other.ownerPlayer.object) or (other.team!=team) {
                            repeat(3) {
                                var blood;
                                blood = instance_create(x,y,Blood);
                                blood.direction = point_direction(other.x,other.y,x,y)-180;
                            }
                        }
                    }
                } else {
                    if hp > 0 and id==other.ownerPlayer.object and other.team == team and ubered{ //just in case
                        moveStatus = 1;
                        speed*=1.055; //slight nerf to compensate for uber
                    }
                }
            }
        }

        with (Sentry) {
            if (distance_to_object(other) < other.blastRadius){
                if(other.team != team)
                {
                    damageSentry( other.ownerPlayer, id, other.explosionDamage*(1-(distance_to_object(other)/other.blastRadius)) );
                    
                    lastDamageDealer = other.ownerPlayer;
                    lastDamageSource = other.weapon;
                }
            }
        }        
        
        with (Generator) {
            if (distance_to_object(other) < other.blastRadius){
                if(other.team != team)
                {
                    damageGenerator( other.ownerPlayer, id, other.explosionDamage*(1-(distance_to_object(other)/other.blastRadius)) );
                }
            }
        }
        
        with (DeadGuy) {
          if (distance_to_object(other) < other.blastRadius){
            motion_add(point_direction(other.x,other.y,x,y),10-10*(distance_to_object(other)/other.blastRadius));
          }
        }
        
        with (Gib) {
            if (distance_to_object(other) < other.blastRadius){
                motion_add(point_direction(other.x,other.y,x,y),15-15*(distance_to_object(other)/other.blastRadius));
                rotspeed=random(151)-75;
            }
        }
    
        with(Mine) {
            if (distance_to_object(other) < other.blastRadius*0.66 and (other.team != team or other.ownerPlayer == ownerPlayer)){
                event_user(2);
            }
        }
        
        with(LooseSheet) {
            if (distance_to_object(other) < other.blastRadius){
                motion_add(point_direction(other.x,other.y,x,y),10-10*(distance_to_object(other)/other.blastRadius));
            }
        }
        
        with(Bubble) {
            if (distance_to_object(other) < other.blastRadius*0.66){
                instance_destroy();
            }    
        }

        instance_destroy();
    }
}

