
healed = false;
healer = "";
healerUberCharge = 0;

for(i=0; i<ds_list_size(global.players); i+=1) {
    player = ds_list_find_value(global.players, i);
    if(player.team == global.myself.team && player.class == CLASS_MEDIC) {
        if(player.object != -1){
            if(player.object.currentWeapon.healTarget == global.myself){
                healed = true;
                healer = player.name;
                healerUberCharge = player.object.currentWeapon.uberCharge;
                healerhp = floor(player.object.hp);
            }
        }
    }
}

