{
    player = global.paramPlayer;
    team = player.team;
    
    left_bound_offset = sprite_get_bbox_left(sprite_index)-sprite_get_xoffset(sprite_index);
    right_bound_offset = sprite_get_bbox_right(sprite_index)-sprite_get_xoffset(sprite_index);
    top_bound_offset = sprite_get_bbox_top(sprite_index)-sprite_get_yoffset(sprite_index);
    bottom_bound_offset = sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index);
    
    // Default properties of Characters (those where defaults make sense)
    canDoublejump = 0;
    canCloak = 0;
    canBuild = 0;
    baseJumpStrength = 8+(0.6/2); // reduce the part of the initial frame of gravity that we don't apply anymore (not framerate dependent, meant to match old 30fps arc)
    jumpStrength = baseJumpStrength;
    capStrength = 1;
    
    // for true framerate-independent jumping arcs
    applied_gravity = 0;
    
    // 
    hp = maxHp;
    flamecount = 0;
    invisible = false;
    intel = false;
    taunting = false;
    doublejumpUsed = 0;
    ubered = 0;
    stabbing = 0;
    onCabinet = 0;
    wantToJump = false;
    timeUnscathed = 0;
    syncWrongness = 0;
    
    // animation state
    equipmentOffset = 0;
    onground = true;
    still = true;
    yoffset = 0;
    sprite_special = global.xmas;
    
    // class sprite vars
    if(player.class == CLASS_QUOTE)
    {
        spriteRun = sprite_index;
        spriteJump = sprite_index;
        spriteStand = sprite_index;
        spriteLeanR = sprite_index;
        spriteLeanL = sprite_index;
        spriteIntel = sprite_index; // it's an underlay
    }
    else
    {
        spriteRun = getCharacterSpriteId(player.class, player.team, "Run");
        spriteJump = getCharacterSpriteId(player.class, player.team, "Jump");
        spriteStand = getCharacterSpriteId(player.class, player.team, "Stand");
        spriteLeanR = getCharacterSpriteId(player.class, player.team, "LeanR");
        spriteLeanL = getCharacterSpriteId(player.class, player.team, "LeanL");
        spriteIntel = getCharacterSpriteId(player.class, player.team, "Intel");
    }

    spriteDead = getCharacterSpriteId(player.class, player.team, "Dead");
    humiliationPoses = getCharacterSpriteId(player.class, player.team, "H");
    tauntsprite = getCharacterSpriteId(player.class, player.team, "Taunt");
    
    //afterburn stuff
    burnIntensity = 0; // "heat"
    legIntensity = 7; // afterburn intensity after which additional intsity additions are halved.
                      // it's called a "leg" becauase of a similar concept in dynamic range compression.
    maxIntensity = 13; //maximum afterburn intensity in DPS
    burnDuration = 0; // "fuel"
    maxDuration = 210; //maximum afterburn length in duration ticks (see durationDecay)
    decayDelay = 90; //time between last ignition and intensity lowering
    decayDuration = 90; //time between intensity lowering and zeroing out
    durationDecay = 1; //amount that duration lowers per step
    intensityDecay = burnIntensity / decayDuration;
    burnedBy = -1;
    afterburnSource = -1;
    numFlames = 5 ; //purely cosmetic - the number of flames that someone has with max burnIntensity
    realnumflames = numFlames;
    for(i = 0; i < numFlames; i += 1)
    {
        flameArray_x[i] = random_range(-(right_bound_offset - left_bound_offset)/2, (right_bound_offset - left_bound_offset)/2);
        flameArray_y[i] = random_range(-(bottom_bound_offset - top_bound_offset)/2, (bottom_bound_offset - top_bound_offset)/2);
    }
    alarm[5] = 30 / global.delta_factor; //this alarm re-randomizes the flame positions
    
    // controls
    keyState = 0;
    lastKeyState = 0;
    pressedKeys = 0;
    releasedKeys = 0;
    aimDirection = 0;
    netAimDirection = 0;
    aimDistance = 0;

    image_speed = 0;
    tauntspeed = 3;
    
    animationOffset = CHARACTER_ANIMATION_NORMAL;
    animationImage = 0;
    humiliationOffset = irandom(10)*3; //support for 10 different animations is more than enough
    
    // spinjumping state vars
    _last_xscale = image_xscale;
    spinjumping = false;

    //kill assist/finish off addition
    lastDamageDealer = noone;
    lastDamageSource = -1;
    secondToLastDamageDealer = noone;
    
    bubble = instance_create(0,0,SpeechBubbleO);
    bubble.owner = id;

    afk=false;
    
    // Cloak for Spies
    cloak = false;
    cloakAlpha = 1;
    cloakFlicker = false;

    //healer
    healer = -1;
        
    //canGrabIntel- used for droppan intel
    canGrabIntel = true;
    alarm[1] = 0;
    intelRecharge = 0;
    
    //CP
    cappingPoint = noone;

    //sandvich
    omnomnomnom = false;
    canEat = true;
    eatCooldown = 1350; //45 sec cooldown
    
    //sniper zoom
    zoomed = 0;
    
    //nuts n bolts for contructor
    nutsNBolts = 100;
    maxNutsNBolts = 100;
    
    //jugglin'
    //1 for rocket jump
    //2 for rocket juggle
    //3 for getting air blasted
    //4 for friendly juggles!
    moveStatus = 0;
    
    baseControl = 0.85;
    // warning that baseFriction cannot be equal to 0 nor 1 or div0 will occur
    baseFriction = 1.15;
    controlFactor = baseControl;
    frictionFactor = baseFriction;
    runPower = baseRunPower;
    basemaxspeed = abs(baseRunPower * baseControl / (baseFriction-1));
    highestbasemaxspeed = 9.735; // approximation error < 0.0017 of scout's base max speed

    // used for certain rewards
    stillOverlays = ds_list_create();
    leanROverlays = ds_list_create();
    leanLOverlays = ds_list_create();
    jumpOverlays = ds_list_create();
    runOverlays = ds_list_create();
    walkOverlays = ds_list_create();
    tauntOverlays = ds_list_create();
    crouchOverlays = ds_list_create();
    omnomnomnomOverlays = ds_list_create();
    omnomnomnomSprite = getCharacterSpriteId(CLASS_HEAVY, player.team, "Omnomnomnom");
    demon = -1;
    demonX = 0;
    demonY = 0;
    demonOffset = 0;
    demonDir = 0.5;
    demonFrame = 0;

    gearList = ds_list_create();
    
    // Let's spawn our weapon
    global.paramOwner = id;
    currentWeapon = instance_create(x,y,weapons[0]);
    global.paramOwner = noone;
    
    // Gear that drops with gibs
    has_partyhat     = false;
    has_crown        = false;
    has_navigatorhat = false;

    // Temporary invuln on spawn for deathmatch players
    if(instance_exists(TeamDeathmatchHUD))
    {
        if(player.deathmatch_respawn_bypass != 0)
            deathmatch_invulnerable = player.deathmatch_respawn_bypass;
        else
            deathmatch_invulnerable = global.tdmInvulnerabilityTicks;
        deathmatch_invuln_decay = 0.2; // 5x the normal invuln period when you first spawn
    }
    else
    {
        deathmatch_invulnerable = 0;
        deathmatch_invuln_decay = 0;
    }
    
    // THIS IS A TRUCK LOAD OF GARBAGE CODE THAT SHOULD BE REPLACED ASAP
    
    if(hasClassReward(player, "Grey_Accessories_") and player.class != CLASS_QUOTE)
    {
        ds_list_add(stillOverlays, global.SilverAttireOverlay[player.class]);
        ds_list_add(leanROverlays, global.SilverAttireLeanROverlay[player.class]);
        ds_list_add(leanLOverlays, global.SilverAttireLeanLOverlay[player.class]);
        ds_list_add(jumpOverlays, global.SilverAttireJumpOverlay[player.class]);
        ds_list_add(runOverlays, global.SilverAttireRunOverlay[player.class]);
        ds_list_add(tauntOverlays, global.SilverAttireTaunt[player.class]);
        if (player.class == CLASS_HEAVY)
        {
            ds_list_add(omnomnomnomOverlays, global.SilverSandwichOverlay[player.class]);
            ds_list_add(walkOverlays, global.SilverAttireOverlay[player.class]);
        }
        if (player.class == CLASS_SNIPER)
            ds_list_add(crouchOverlays, global.SilverAttireOverlay[player.class]);
    }
    else if(hasClassReward(player, "Gold_Accessories_") and player.class != CLASS_QUOTE)
    {
        ds_list_add(stillOverlays, global.GoldenAttireOverlay[player.class]);
        ds_list_add(leanROverlays, global.GoldenAttireLeanROverlay[player.class]);
        ds_list_add(leanLOverlays, global.GoldenAttireLeanLOverlay[player.class]);
        ds_list_add(jumpOverlays, global.GoldenAttireJumpOverlay[player.class]);
        ds_list_add(runOverlays, global.GoldenAttireRunOverlay[player.class]);
        ds_list_add(tauntOverlays, global.GoldenAttireTaunt[player.class]);
        if (player.class == CLASS_HEAVY)
        {
            ds_list_add(omnomnomnomOverlays, global.GoldenSandwichOverlay[player.class]);
            ds_list_add(walkOverlays, global.GoldenAttireOverlay[player.class]);
        }
        if (player.class == CLASS_SNIPER)
            ds_list_add(crouchOverlays, global.GoldenAttireOverlay[player.class]);
    }
    // You cannot wear more than one hat at once you dingdong
    // 'BH' reward - *B*obble *H*ead - not available for quote
    if(hasClassReward(player, "BH") and player.class != CLASS_QUOTE)
    {
        // hats use the same sprite for most animations 
        ds_list_add(stillOverlays, global.HatBobbleClassOverlay[player.class]);
        ds_list_add(leanROverlays, global.HatBobbleClassOverlay[player.class]);
        ds_list_add(leanLOverlays, global.HatBobbleClassOverlay[player.class]);
        ds_list_add(jumpOverlays, global.HatBobbleClassOverlay[player.class]);
        ds_list_add(runOverlays, global.HatBobbleClassOverlay[player.class]);
            
        if (player.class == CLASS_HEAVY)
        {
            ds_list_add(walkOverlays, global.HatBobbleClassOverlay[player.class]);
            ds_list_add(omnomnomnomOverlays, global.HatBobbleSandwich[player.class]);
        }
        if (player.class == CLASS_SNIPER)
            ds_list_add(crouchOverlays, global.HatBobbleClassOverlay[player.class]);
            
        if (player.class == CLASS_SPY and player.team == TEAM_BLUE)
        {
            ds_list_add(tauntOverlays, HatBobbleSpyBlueTauntS);
        }
        else
        {
            ds_list_add(tauntOverlays, global.HatBobbleClassTaunt[player.class]);        
        }
    }
    else if(hasClassReward(player, "TopHatMonocle_"))
    {
        ds_list_add(stillOverlays, global.TopHatMonocleOverlay[player.class]);
        ds_list_add(leanROverlays, global.TopHatMonocleOverlay[player.class]);
        ds_list_add(leanLOverlays, global.TopHatMonocleOverlay[player.class]);
        ds_list_add(jumpOverlays, global.TopHatMonocleOverlay[player.class]);
        ds_list_add(runOverlays, global.TopHatMonocleOverlay[player.class]);
            
        if (player.class == CLASS_HEAVY)
        {
            ds_list_add(walkOverlays, global.TopHatMonocleOverlay[player.class]);
            ds_list_add(omnomnomnomOverlays, global.TopHatMonocleSandwich[player.class]);
        }
        if (player.class == CLASS_SNIPER)
            ds_list_add(crouchOverlays, global.TopHatMonocleOverlay[player.class]);
            
        if (player.class == CLASS_QUOTE and player.team == TEAM_BLUE)
        {
            ds_list_add(tauntOverlays, QuerlyBlueMonocleHatTauntS);
        }
        else
        {
            ds_list_add(tauntOverlays, global.TopHatMonocleTaunt[player.class]);        
        }
    }
    else if(hasClassReward(player, "TopHat_"))
    {
        ds_list_add(stillOverlays, global.TopHatOverlay[player.class]);
        ds_list_add(leanROverlays, global.TopHatOverlay[player.class]);
        ds_list_add(leanLOverlays, global.TopHatOverlay[player.class]);
        ds_list_add(jumpOverlays, global.TopHatOverlay[player.class]);
        ds_list_add(runOverlays, global.TopHatOverlay[player.class]);
            
        if (player.class == CLASS_HEAVY)
        {
            ds_list_add(walkOverlays, global.TopHatOverlay[player.class]);
            ds_list_add(omnomnomnomOverlays, global.TopHatSandwich[player.class]);
        }
        if (player.class == CLASS_SNIPER)
            ds_list_add(crouchOverlays, global.TopHatOverlay[player.class]);
            
        if (player.class == CLASS_QUOTE and player.team == TEAM_BLUE)
        {
            ds_list_add(tauntOverlays, QuerlyBlueTopHatTauntS);
        }
        else
        {
            ds_list_add(tauntOverlays, global.TopHatTaunt[player.class]);        
        }
    }
    else if (hasReward(player, "Crown"))
    {
        ds_list_add(gearList, GEAR_CROWN);
        has_crown = true;
    }
    else if (hasReward(player, "Navigator"))
    {
        ds_list_add(gearList, GEAR_NAVIGATORHAT);
        has_navigatorhat = true;
    }
    else if (global.gg_birthday)
    {
        ds_list_add(gearList, GEAR_PARTY_HAT);
        has_partyhat = true;
    }
    if (hasReward(player, "WillOWisp"))
    {
        demon = WillOWispS;
    }
    if (hasClassReward(player, "HaxxyCape_"))
    {
        ds_list_add(gearList, GEAR_HAXXY_CAPE);
    }
    else if (hasClassReward(player, "RaybannCape_"))
    {
        ds_list_add(gearList, GEAR_RAYBANN_CAPE);
    }
    if(hasClassReward(player, "GW"))
    {
        // 'GW' reward - *G*olden *W*eapon
        // Prepend to the start of the overlay list, so that it gets drawn first (it's a full sprite replacement)
        switch(player.class)
        {
            case CLASS_SCOUT:
            case CLASS_SOLDIER:
            case CLASS_SNIPER:
            case CLASS_DEMOMAN:
            case CLASS_HEAVY:
            case CLASS_PYRO:
            case CLASS_MEDIC:
                ds_list_insert(tauntOverlays, 0, getCharacterSpriteId(player.class, player.team, "GoldWeaponTaunt"));
                break;
        }
        
        if(player.class == CLASS_HEAVY)
        {
            ds_list_insert(omnomnomnomOverlays, 0, getCharacterSpriteId(global.paramPlayer.class, global.paramPlayer.team, "OmnomnomnomGoldWeapon"));
        }
    }
}

