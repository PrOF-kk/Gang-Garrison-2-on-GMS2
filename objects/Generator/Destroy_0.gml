playsound(x,y,ExplosionSnd);
playsound(x,y,RevolverSnd);
playsound(x,y,CPBeginCapSnd);
effect_create_above(ef_explosion,x+30-random(60),y+30-random(60),2,c_gray);
effect_create_above(ef_explosion,x,y,2,c_red);

with (Character) {
    if (distance_to_object(other) < other.blastRadius){
        motion_add(point_direction(other.x,other.y,x,y),15-15*(distance_to_object(other)/other.blastRadius));
        hp -= 999;
        if(instance_exists(lastDamageDealer) && lastDamageDealer != player) {
            lastDamageSource = DAMAGE_SOURCE_FINISHED_OFF_GIB;
        }else{
            lastDamageDealer = noone;
            lastDamageSource = DAMAGE_SOURCE_GENERATOR_EXPLOSION;
        }
    }
}

with (Sentry){
    if (distance_to_object(other) < other.blastRadius) { 
        hp -= 999;
        lastDamageDealer = noone;
        lastDamageSource = DAMAGE_SOURCE_GENERATOR_EXPLOSION;
    }   
}    
     
       
with (Rocket) {
    if (distance_to_object(other) < other.blastRadius){
        characterHit=-1;
        event_user(5);
    }
}
    
with (DeadGuy) {
    if (distance_to_object(other) < other.blastRadius){
        motion_add(point_direction(other.x,other.y,x,y),10-10*(distance_to_object(other)/other.blastRadius));
    }
}
    
with(Mine) {
    if (distance_to_object(other) < other.blastRadius){
        event_user(2);
    }
}
with (Gib) {
    if (distance_to_object(other) < other.blastRadius){
        motion_add(point_direction(other.x,other.y,x,y),15-15*(distance_to_object(other)/other.blastRadius));
        rotspeed=random(151)-75;
    }
}
with(Bubble) {
    if (distance_to_object(other) < other.blastRadius){
        instance_destroy();
    }    
}

