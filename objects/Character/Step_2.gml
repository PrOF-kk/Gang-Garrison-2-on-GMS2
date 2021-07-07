charSetSolids();


// Climbing down stairs
// if we aren't falling this frame, and we're not on a dropdown platform
if(vspeed == 0 and ((keyState & $02) or !place_meeting(x, y+1, DropdownPlatform) or place_meeting(x, y, DropdownPlatform)))
{ 
    if(place_free(x,y+6))
        if(!place_free(x,y+7))
            y += 6;
        else if(speed > 6) if(place_free(x,y+12)) if(!place_free(x,y+13))
            y += 12;
}
xprevious = x;
yprevious = y;

charUnsetSolids();

if(global.isHost && hp<=0) {
    var assistant;
    assistant = secondToLastDamageDealer;
    with(lastDamageDealer)
        if (object)
            if (object.healer)
                assistant = object.healer;
                
    sendEventPlayerDeath(player, lastDamageDealer, assistant, lastDamageSource);
    doEventPlayerDeath(player, lastDamageDealer, assistant, lastDamageSource);
    with(GameServer) {
        ServerBalanceTeams();
    }
    exit;
}
    
if(hp>maxHp) {
    hp=maxHp;
}
    
if(((aimDirection+270) mod 360)>180) {
    image_xscale=1;
    currentWeapon.image_xscale=1;
    currentWeapon.image_angle = aimDirection;
} else {
    image_xscale=-1;
    currentWeapon.image_xscale=-1;
    currentWeapon.image_angle = aimDirection+180;
}
    
currentWeapon.x=round(x);
currentWeapon.y=round(y);
    
// Limit people to the area of the room to prevent the
// "Falling through the floors" issue.
if(x<0) {
    x=0;
}
if(x>map_width()){
    x = map_width();
}
if(y<0) {
    y = 0;
}
if(y>map_height()){
    y = map_height();
}

    
// Cloak
if (cloak and cloakAlpha > 0 and !cloakFlicker)
    cloakAlpha = max(cloakAlpha - 0.05, 0);
else if (!cloak and cloakAlpha < 1)
    cloakAlpha = min(cloakAlpha + 0.05, 1);
    
// Taunts
if (taunting)
{
    tauntindex += tauntspeed*0.1 * global.delta_factor;
    if (tauntindex >= sprite_get_number(tauntsprite))
        taunting = false;
    if (hasClassReward(player, "TauntMoney_"))
    {
        if (tauntindex == 0.30)
            instance_create(x, y, Money);
    }
}
    
//sandvich
if (omnomnomnom)
{
    omnomnomnomindex += 0.25 * global.delta_factor;
    image_xscale=xscale;
    if(hp < maxHp) // This should prevent the "ate and got hit but didn't refresh cooldown" bug
    { // Also, cooldown is now reset continually until fully healed or finished eating.
        canEat = false;
        alarm[6] = eatCooldown / global.delta_factor;
    }
    if (hp <= maxHp)
        hp += 1.6 * global.delta_factor;
    if (omnomnomnomindex >= omnomnomnomend)
        omnomnomnom=false;
}

//for things polling whether the character is on a medcabinet
onCabinet = place_meeting(x, y, HealingCabinet);

// Last x/y position for death cam if player is dead
player.lastKnownx=x;
player.lastKnowny=y;

// Here the view is set
if (player == global.myself)
{
    if (global.myself.class == CLASS_SNIPER and zoomed)
    {
        var relxmouse, relymouse;
        relxmouse = min(max(window_views_mouse_get_x()-__view_get( e__VW.XView, 0 ), 0), __view_get( e__VW.WView, 0 ));
        relymouse = min(max(window_views_mouse_get_y()-__view_get( e__VW.YView, 0 ), 0), __view_get( e__VW.HView, 0 ));
        
        __view_set( e__VW.XView, 0, x+relxmouse-__view_get( e__VW.WView, 0 ) );
        __view_set( e__VW.YView, 0, y+relymouse-__view_get( e__VW.HView, 0 ) );
    }
    else
    {
        __view_set( e__VW.XView, 0, x-__view_get( e__VW.WView, 0 )/2 );
        __view_set( e__VW.YView, 0, y-__view_get( e__VW.HView, 0 )/2 );
    }
}

realnumflames = numFlames * burnDuration / maxDuration;

// Decay deathmatch invulnerability if needed
if(deathmatch_invulnerable > 0)
    deathmatch_invulnerable -= global.delta_factor * deathmatch_invuln_decay;
if(deathmatch_invulnerable <= 0)
    deathmatch_invulnerable = 0;



