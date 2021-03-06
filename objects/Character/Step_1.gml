var stuckInWall, standingOnObstacle, onNonSurfingGround, downOrPressedKeys;
charSetSolids();
stuckInWall = !place_free(x,y);
obstacleBelow = !place_free(x,y+1);
charUnsetSolids();
onground = false;
onNonSurfingGround = false;
downOrPressedKeys = keyState | pressedKeys;
if(vspeed >= 0)
{
    if(obstacleBelow)
    {
        onground = true;
        onNonSurfingGround = true;
    }
    // Check whether we're potentially standing on any platform before checking each one
    else if(!(keyState & $02))
    {
        if(place_meeting(x, y+1, DropdownPlatform))
        {
            with(DropdownPlatform)
            {
                if(!place_meeting(x, y-1, other)) continue; // We can only stand on platforms immediately below us
                if(place_meeting(x, y, other)) continue;    // We can't stand on platforms we already collide with
                other.onground = true;
                if(resetMoveStatus)
                    onNonSurfingGround = true;
                // If we didn't find a nonsurfing dropdown yet, we have to keep looking
                // because there may still be one overlapping the surfing dropdown we found
                if(onNonSurfingGround) break;
            }
        }
    }
}

if(onNonSurfingGround)
    moveStatus = 0;
    
if(onground)
    doublejumpUsed = 0;

// Apply afterburn
if (global.run_virtual_ticks)
{
    if (burnDuration > 0)
    {
        if(hp > 0)
        {   // Don't count if someone else already finished him off, to prevent afterburn from "stealing" sticky kills (Bug #1021989)
            if (lastDamageDealer != burnedBy and lastDamageDealer != player)
            {
                secondToLastDamageDealer = lastDamageDealer;
                alarm[4] = alarm[3];
            }
            alarm[3] = ASSIST_TIME / global.delta_factor;
            lastDamageDealer = burnedBy;
            lastDamageSource = afterburnSource;
            dealDamage(lastDamageDealer, id, burnIntensity / 30);
        }
        burnDuration -= durationDecay;
        timeUnscathed = 0;
    }
    if (alarm[0] == -1 && burnIntensity > 0) burnIntensity -= intensityDecay;
    if (burnDuration <= 0 || burnIntensity <= 0)
    {
        burnDuration = 0;
        burnIntensity = 0;
        burnedBy = -1;
        afterburnSource = -1;
    }
}
// Handle input
if(player.queueJump)
{
    if (pressedKeys & $80)
        wantToJump = true;
    else if (releasedKeys & $80)
        wantToJump = false;
}

if(!taunting and !omnomnomnom)
{
    if(!player.humiliated and downOrPressedKeys & $10)
    {
        with(currentWeapon) event_user(1);
        deathmatch_invulnerable = 0;
    }
    if(!player.humiliated and pressedKeys & $01)  {
        if (!invisible && cloakAlpha == 1)
            taunting=true;
        tauntindex=0;
        image_speed=tauntspeed;
    } 
    
    if(((pressedKeys & $80) or (player.queueJump and wantToJump)) and vspeed > -jumpStrength)
    {
        if (onground and !stuckInWall)
        {
            deathmatch_invuln_decay = 1;
            if(not stabbing)
            {
                wantToJump = false;
                playsound(x,y,JumpSnd);
                vspeed = -jumpStrength;
                onground = false; // Correct unless you are standing on a platform which moves up faster than jumpStrength
            }
        }
        else if(canDoublejump and !doublejumpUsed)
        {
            deathmatch_invuln_decay = 1;
            wantToJump = false;
            vspeed = -jumpStrength;
            onground = false; // Correct unless you are standing on a platform which moves up faster than jumpStrength
            playsound(x,y,JumpSnd);
            doublejumpUsed = 1;
            moveStatus = 0;
        }
    }
}

// Right click
if (!player.humiliated and (downOrPressedKeys & $08)
    and (!taunting or player.class == CLASS_DEMOMAN) and !omnomnomnom)
{
    deathmatch_invulnerable = 0;
    with(currentWeapon)
        event_user(2);
}

// Cloak
if (!player.humiliated && (pressedKeys & $08)
    && canCloak && ((cloakAlpha == 1 and !cloak) or cloak)
    && !intel  && !taunting)
{
    deathmatch_invulnerable = 0;
    if(currentWeapon.readyToStab) {
        if (cloak) { // stop spies immediately picking up intel after uncloaking
            canGrabIntel = false;
            alarm[1] = max(alarm[1], 25 / global.delta_factor); // avoid decreasing the alarm on accident
        }
        cloak = !cloak;
    }
}

switch(moveStatus) // moveStatus is reset in collision with ceilings (including doors if they reject you)
{
case 1: //If I am rocketing/mining myself
    controlFactor = 0.65;
    frictionFactor = 1;
    break;
case 2: //If I am rocketing/mining an enemy
    controlFactor = 0.45;
    frictionFactor = 1.05;
    break;
case 3: //Airblast
    controlFactor = 0.35;
    frictionFactor = 1.05;
    break;
case 4: //If I am rocketing/mining a teamate
    controlFactor = baseControl;
    frictionFactor = 1;
    break;
default:
    if (player.humiliated)
        controlFactor = baseControl-0.2;
    else if (intel)
        controlFactor = baseControl-0.1;
    else
        controlFactor = baseControl;
    frictionFactor = baseFriction;
}

var rocketJumping;
rocketJumping = moveStatus == 1 or moveStatus == 2 or moveStatus == 4;
if(rocketJumping)
{
    if(global.run_virtual_ticks)
    {
        if !variable_local_exists("jumpFlameParticleType")
        {
            jumpFlameParticleType = part_type_create();
            part_type_sprite(jumpFlameParticleType,FlameS,true,false,true);
            part_type_alpha2(jumpFlameParticleType,1,0.3);
            part_type_life(jumpFlameParticleType,2/global.delta_factor,5/global.delta_factor);
            part_type_scale(jumpFlameParticleType,0.7,-0.65);
        }
        
        if !variable_global_exists("jumpFlameParticleSystem")
        {
            global.jumpFlameParticleSystem = part_system_create();
            part_system_depth(global.jumpFlameParticleSystem, 10);
        }
        
        if(global.particles == PARTICLES_NORMAL)
        {
            if(random(1) > (controlFactor+frictionFactor)/2)
            {
                effect_create_below(ef_smoke,x-hspeed*1.2,y-vspeed*1.2+20,0,c_gray);
            }
        }
        if(global.particles == PARTICLES_NORMAL or global.particles == PARTICLES_ALTERNATIVE)
        {
            if(random(7) < 5)
            {
                part_particles_create(global.jumpFlameParticleSystem,x,y+19,jumpFlameParticleType,1);
            }
        }
    }
}

if(spinjumping)
{
    
    if !variable_local_exists("jumpDustParticleType")
    {
        jumpDustParticleType = part_type_create();
        part_type_sprite(jumpDustParticleType,SpeedBoostS,false,false,true);
        part_type_alpha3(jumpDustParticleType,0.7,0.5,0);
        part_type_life(jumpDustParticleType,15/global.delta_factor,30/global.delta_factor);
        part_type_scale(jumpDustParticleType,1,1);
        part_type_orientation(jumpDustParticleType, -90, -90, 0, 0, 0);
    }
    if !variable_global_exists("jumpDustParticleSystem")
    {
        global.jumpDustParticleSystem = part_system_create();
        part_system_depth(global.jumpDustParticleSystem, 10);
    }
    
    if(global.particles == PARTICLES_NORMAL or global.particles == PARTICLES_ALTERNATIVE)
    {
        if(random(4) < 4)
        {
            if(sign(_last_xscale) < 0)
                part_particles_create(global.jumpDustParticleSystem,x+right_bound_offset+1,y+bottom_bound_offset-4,jumpDustParticleType,1);
            else
                part_particles_create(global.jumpDustParticleSystem,x+left_bound_offset +2,y+bottom_bound_offset-4,jumpDustParticleType,1);
        }
    }
}

controlling = false;
repeat(global.frameskip)
{
    // Do movement
    if(!taunting && !omnomnomnom)
    {
        if(downOrPressedKeys & $40 and hspeed >= -basemaxspeed)
        {
            hspeed -= runPower*controlFactor * global.skip_delta_factor;
            controlling = true;
        }
        if(downOrPressedKeys & $20 and hspeed <= basemaxspeed)
        {
            hspeed += runPower*controlFactor * global.skip_delta_factor;
            controlling = true;
        }
        // cancel out 'controlling' if both buttons are pressed
        if((downOrPressedKeys & $60) == $60)
        {
            controlling = false;
        }
    }
    // divide friction as normal if going way too fast
    if(abs(hspeed) > basemaxspeed * 2 or
       (downOrPressedKeys & $60 and abs(hspeed) < basemaxspeed))
        hspeed /= delta_mult_skip(baseFriction);
    else //otherwise divide by the moveStatus's friction
        hspeed /= delta_mult_skip(frictionFactor);
}
if(controlling)
    deathmatch_invuln_decay = 1;
    
pressedKeys = 0;
releasedKeys = 0;

// flame bubble
if burnDuration>0 && player.class != CLASS_PYRO and random(80) <= 1 {
    setChatBubble(player, 49);
}

// stop players who are moving too slowly (avoid "ice skating")
if (abs(hspeed) < 0.195 and !controlling)
{
    hspeed=0;
}

// In order to make the gravity truly framerate-independent, we need to apply half of it before, and half of it after, each motion.
// The math concept is, the period of a frame starts with a vertical velocity of N, and ends with N+gravity. This ends up being equivalent to the above idea.
// Old gg2 gravity "skipped" arcs, and behaved very slightly differently on 60fps and 30fps.
// Using truly framerate-indepent gravity means that the strength of jumping has to change to create the same arc.
// The change in the strength of jumping corresponds to the change in the strength of the initial frame of gravity.
// Since the inital frame of gravity is half what it used to be, the strength of jumping needs to change the same amount, which I did elsewhere.
// I used the 30fps value of "initial frame of gravity", since that represents gg2's canonical jump arc.
// This change PROBABLY makes explosive jumping slightly more powerful, because the initial strength of that cannot be tweaked without also altering mid-air arcs.
// Actually, because GG2 used to not apply on the first frame after jumping, jumping velocity is slightly larger, not smaller.
if(!onground and !stuckInWall)
{
    if(rocketJumping)
        applied_gravity += 0.54;
    else
        applied_gravity += 0.6;        
}

if (intel)
{
    deathmatch_invulnerable = 0; // in case anyone ever applies this code to another gamemode
    if (global.run_virtual_ticks)
    {
        if (speed > 0.195)
        {
            if (random(1) > 0.90)
            {
                var sheet;
                sheet = instance_create(x,y-11+random(9),LooseSheet);
                sheet.hspeed = hspeed;
                if (hasReward(player, "GoldTrail"))
                    sheet.sprite_index = choose(SheetFallingGold1, SheetFallingGold2, SheetFallingGold3);
            }
        }
        else if (random(1) > 0.975)
        {
            var sheet;
            sheet = instance_create(x,y-11+random(9),LooseSheet);
            sheet.hspeed = hspeed;
            if (hasReward(player, "GoldTrail"))
                sheet.sprite_index = choose(SheetFallingGold1, SheetFallingGold2, SheetFallingGold3);
        }
    }
    if (cloak)
    {
        cloak=false;
        cloakAlpha=1;
    }
    if (!omnomnomnom) // Do not recharge intel timer if eating
        intelRecharge = min(INTEL_MAX_TIMER, // Cap timer charge at the intel timer's length (bandwidth)
                            intelRecharge + global.delta_factor * // ...After adding some value to it 
                            INTEL_MAX_TIMER/((3+abs(min(hspeed, 7))/3.5)*30)); // ...Which starts at a rate of full charge per three seconds, and reduces linearly with speed, down to full charge per five seconds with a scout's max speed
}

if(player.humiliated)
    deathmatch_invulnerable = 0;

var sprite_length;
if(player.class == CLASS_QUOTE or sprite_special or zoomed or player.humiliated)
    sprite_length = 2;
else
    sprite_length = CHARACTER_ANIMATION_LEN;

var jumpAnimationImage;
if(player.humiliated)
    jumpAnimationImage = 2;
else
    jumpAnimationImage = 1;

if (onground and hspeed == 0)
    animationImage = 0;
else if(!onground)
    animationImage = jumpAnimationImage;
else
{
    // onground and not still
    animationImage += min(abs(hspeed), 8)*sign(hspeed)*image_xscale*global.delta_factor/20;
    animationImage = (animationImage+sprite_length) mod sprite_length;
}

// drop intel if ubered or round is over
if (intel and (ubered or global.mapchanging) and global.isHost) {
    sendEventDropIntel(player);
    doEventDropIntel(player);
}

//gotta regenerate some nuts
nutsNBolts = min(nutsNBolts+(0.1 * global.delta_factor), maxNutsNBolts);

//ubered max out ammo and extinguish flames
if ubered {
    if (burnIntensity > 0 || burnDuration > 0)
    {
        burnIntensity = 0;
        burnDuration = 0;
        burnedBy = -1;
    }
    if instance_exists(currentWeapon) {
        with(currentWeapon) {
            if(variable_local_exists("maxAmmo")) {
                ammoCount = maxAmmo;
            }
            if (alarm[5] > 0)
            {
                // Stop the animation
                event_perform(ev_alarm, 5);
            }
            alarm[5] = -1;
        }
    }
}

//give max ammo for players on the winning team
var arenaRoundEnd;
arenaRoundEnd = false;
if (instance_exists(ArenaHUD)) { 
    arenaRoundEnd = (ArenaHUD.state == ArenaHUD.ARENA_STATE_ROUND_END);
}

if ((arenaRoundEnd or global.mapchanging) and !player.humiliated) {
    if instance_exists(currentWeapon) {
        with(currentWeapon){
            if(variable_local_exists("maxAmmo")) {
                ammoCount = maxAmmo;
            }
            if (alarm[5] > 0)
            {
                // Stop the animation
                event_perform(ev_alarm, 5);
            }
            alarm[5] = -1;
        }
    }
}

//drop cloak and unscope if on losing team or stalemate
if (player.humiliated)
{
    if (zoomed)
        toggleZoom(id);
    if (!stabbing)
        cloak = false;
}

// Determine if the character is capturing a CP, and which
var zone;
zone = collision_point(x,y,CaptureZone,0,0);

if(zone >= 0 and !cloak and cloakAlpha == 1)
{
    cappingPoint = zone.cp;
    deathmatch_invulnerable = 0; // in case anyone ever applies this code to another gamemode
}
else
    cappingPoint = noone;


