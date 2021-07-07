{
    if(exploded == true) {
        exit;
    } else {
        exploded = true;
    }
    var explosion;
    explosion = instance_create(x,y,Explosion);
    explosion.sprite_index = ExplosionSmallS;
    playsound(x,y,ExplosionSnd);
    
    with (Character) {
        if (distance_to_object(other) < other.blastRadius and !(team == other.team and id != other.ownerPlayer.object and place_meeting(x, y+1, Obstacle)))
        {
            var rdir, vectorfactor;
            rdir = point_direction(other.x, other.y, x+(left_bound_offset+right_bound_offset)/2, y+(top_bound_offset+bottom_bound_offset)/2);
            vectorfactor = point_distance(0, 0, sin(degtorad(rdir)), cos(degtorad(rdir))*0.8);
            if (1 - distance_to_object(other)/other.blastRadius <= 0.25 and other.splashThreshhold) // skip if we're out of theshhold
                continue;
            motion_add(rdir, min(15, other.knockback-other.knockback*(distance_to_object(other)/other.blastRadius)) * vectorfactor);
            if((other.team != team or id==other.ownerPlayer.object) and !ubered and hp > 0)
            {
                var dmg;
                dmg = other.explosionDamage*(1-(distance_to_object(other)/other.blastRadius));
                if id == other.ownerPlayer.object// self damage resistance
                    dmg *= 5/9;
                damageCharacter(other.ownerPlayer, id, dmg);
                timeUnscathed = 0;
                if (id == other.ownerPlayer.object and instance_exists(lastDamageDealer) and lastDamageDealer != other.ownerPlayer and !instance_exists(other.reflector))
                    lastDamageSource = DAMAGE_SOURCE_FINISHED_OFF_GIB;
                else 
                {
                    if (lastDamageDealer != other.ownerPlayer and lastDamageDealer != player and other.reflector != lastDamageDealer)
                    {
                        secondToLastDamageDealer = lastDamageDealer;
                        alarm[4] = alarm[3]
                    }
                    if (other.ownerPlayer != id or (instance_exists(other.reflector) and other.ownerPlayer == id))
                        alarm[3] = ASSIST_TIME / global.delta_factor;
                    lastDamageDealer = other.ownerPlayer;
                    lastDamageSource = other.weapon;
                    if (id==other.ownerPlayer.object and instance_exists(other.reflector))
                    {
                        lastDamageDealer = other.reflector;
                        lastDamageSource = DAMAGE_SOURCE_REFLECTED_STICKY;
                    }
                }
                if(global.gibLevel > 0)
                {
                    repeat(3)
                    {
                        var blood;
                        blood = instance_create(x,y,Blood);
                        blood.direction = point_direction(other.x,other.y,x,y)-180;
                    }
                }
                if (id==other.ownerPlayer.object)
                    moveStatus = 1;
                else
                    moveStatus = 4;
            }
            else if (hp > 0 and id==other.ownerPlayer.object and ubered)
            {
                // Special case allowing you to minejump even when ubered
                moveStatus = 1;
            }
            dealFlicker(id);
        }
    }

    
    with (Sentry)
    {
        if (distance_to_object(other) < other.blastRadius) and (team != other.team)
        { 
            if (1 - distance_to_object(other)/other.blastRadius <= 0.25 and other.splashThreshhold) // skip if we're out of theshhold
                continue;
            damageSentry(other.ownerPlayer, id, other.explosionDamage*3/2*(1-(distance_to_object(other)/other.blastRadius))); // we want sentries to take ~11% extra damage so that two stickies will do 100 instead of 90 dmg. we don't change the base damage so scouts can't be 2-hitted. 
            lastDamageDealer = other.ownerPlayer;
            lastDamageSource = DAMAGE_SOURCE_MINEGUN;
        }   
    }    
     
     with (Generator)
     {
        if( (distance_to_object(other) < other.blastRadius) and (team != other.team) )
        { 
            if (1 - distance_to_object(other)/other.blastRadius <= 0.25 and other.splashThreshhold) // skip if we're out of theshhold
                continue;
            damageGenerator(other.ownerPlayer, id, other.explosionDamage*(1-(distance_to_object(other)/other.blastRadius)));
        }   
    }
       
    with (Rocket)
    {
        if (distance_to_object(other) < other.affectRadius * 0.75
            and (other.team != team or other.ownerPlayer == ownerPlayer))
        {
            if(distance_to_object(other) < other.affectRadius * 0.25)
            {
                characterHit = -1;
                event_user(5);
            }
            else
            {
                motion_add(point_direction(other.x,other.y,x,y),10-10*(distance_to_object(other)/(other.affectRadius)));
            }
        }
    }
    
    with (DeadGuy)
    {
        if (distance_to_object(other) < other.affectRadius * 0.75)
        {
            motion_add(point_direction(other.x,other.y,x,y),10-10*(distance_to_object(other)/other.affectRadius));
        }
    }
    
    with(Mine) {
        if (distance_to_object(other) < other.blastRadius
            and (other.team != team or other.ownerPlayer == ownerPlayer))
        {
            if (1 - distance_to_object(other)/other.blastRadius <= 0.25 and other.splashThreshhold) // skip if we're out of theshhold
                continue;
            event_user(2);
        }
    }
    with (Gib)
    {
        if (distance_to_object(other) < other.affectRadius * 0.75)
        {
            motion_add(point_direction(other.x,other.y,x,y),15-15*(distance_to_object(other)/other.affectRadius));
            rotspeed=random(151)-75;
        }
    }
    
    with(LooseSheet)
    {
        if (distance_to_object(other) < other.affectRadius * 0.75)
            motion_add(point_direction(other.x, other.y, x, y)
                      ,10-10*(distance_to_object(other)/other.affectRadius));
        
    }
    
    // Handle bubbles
    
    with(Bubble)
    {
        if (point_distance(x, y, other.x, other.y) < other.blastRadius + selfPopRadius)
            instance_destroy();
    }
    
    instance_destroy();
}

