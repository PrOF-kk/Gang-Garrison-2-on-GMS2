xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

if (distance_to_point(xoffset+xsize/2,yoffset+ysize/2) > 800)
    exit;

if(intel and intelRecharge < 900)
    draw_intel_timer(intelRecharge/900, team == TEAM_RED, -8);

draw_set_alpha(0.3);
// backing halo for deathmatch-invulnerable players
if(deathmatch_invulnerable != 0) // must be != 0
{
    draw_circle_color(x, y, 50, c_white, c_white, false);
    if((deathmatch_invulnerable > 0) and global.tdmInvulnerabilityTicks != 0)
        draw_circle_color(x, y, deathmatch_invulnerable/global.tdmInvulnerabilityTicks*50.5, c_white, c_white, false);
    else
        draw_circle_color(x, y, 50.5, c_white, c_white, false);
}
draw_set_alpha(1);

var xr, yr;
xr = round(x);
yr = round(y);

image_alpha = cloakAlpha;

if (global.myself.team == team and canCloak)
    image_alpha = cloakAlpha/2 + 0.5;

if (invisible)
    exit;

if(stabbing)
    image_alpha -= power(currentWeapon.stab.alpha, 2);

if (team == global.myself.team and (player != global.myself or global.showHealthBar))
{
    draw_set_alpha(1);
    draw_healthbar(xr-10, yr-30, xr+10, yr-25,hp*100/maxHp,c_black,c_red,c_green,0,true,true);
}

draw_set_alpha(1);
if (team == TEAM_RED)
    ubercolour = c_red;
else
    ubercolour = c_blue;

// sprite resource selection
var sprite, overlayList, noNewAnim, sprite_tilt_left, sprite_tilt_right, overlays_tilt_left, overlays_tilt_right;
noNewAnim = player.class == CLASS_QUOTE or sprite_special or player.humiliated;

if (zoomed)
{
    if (team == TEAM_RED)
        sprite = SniperRedCrouchS;
    else
        sprite = SniperBlueCrouchS;
    overlayList = crouchOverlays;
    animationImage = animationImage mod 2; // sniper crouch only has two frames, avoid overflow
}
// most classes, check for running jumping and standing
else if (!noNewAnim)
{
    if(!onground)
    {
        sprite = spriteJump;
        overlayList = jumpOverlays;
    }
    else
    {
        if(hspeed==0)
        {
            // set up vars for slope detection
            charSetSolids();
            if(image_xscale > 0)
            {
                sprite_tilt_left = spriteLeanL;
                sprite_tilt_right = spriteLeanR;
                overlays_tilt_left = leanLOverlays;
                overlays_tilt_right = leanROverlays;
            }
            else
            {
                sprite_tilt_left = spriteLeanR;
                sprite_tilt_right = spriteLeanL;
                overlays_tilt_left = leanROverlays;
                overlays_tilt_right = leanLOverlays;
            }
            
            // default still sprite
            sprite = spriteStand;
            overlayList = stillOverlays;
            
            { // detect slopes
                var openright, openleft;
                openright = !collision_point_solid(x+6, y+bottom_bound_offset+2) and !collision_point_solid(x+2, y+bottom_bound_offset+2);
                openleft = !collision_point_solid(x-7, y+bottom_bound_offset+2) and !collision_point_solid(x-3, y+bottom_bound_offset+2);
                if (openright)
                {
                    sprite = sprite_tilt_right;
                    overlayList = overlays_tilt_right;
                }
                if (openleft)
                {
                    sprite = sprite_tilt_left;
                    overlayList = overlays_tilt_left;
                }
                if (openright and openleft)
                {
                    openright = !collision_point_solid(x+right_bound_offset, y+bottom_bound_offset+2);
                    openleft = !collision_point_solid(x-left_bound_offset, y+bottom_bound_offset+2);
                    if (openright)
                    {
                        sprite = sprite_tilt_right;
                        overlayList = overlays_tilt_right;
                    }
                    if (openleft)
                    {
                        sprite = sprite_tilt_left;
                        overlayList = overlays_tilt_left;
                    }
                }
            }
                
            charUnsetSolids();
        }
        else
        {
            sprite = spriteRun;
            overlayList = runOverlays;
            if (player.class == CLASS_HEAVY and abs(hspeed) < 3) // alternative sprite for extremely slow moving heavies
            {
                if (team == TEAM_RED)
                {
                    sprite = HeavyRedWalkS;
                    overlayList = walkOverlays;
                }
                else
                {
                    sprite = HeavyBlueWalkS;
                    overlayList = walkOverlays;
                }
            }
        }
    }
}
else
{
    sprite = sprite_index;
    overlayList = stillOverlays;
}

if (sprite != sprite_index and (sprite == spriteLeanR or sprite == spriteLeanL)
    and !taunting and !omnomnomnom and !stabbing // These override "sprite"
    and !noNewAnim)
    yoffset = 6;
else
    yoffset = 0;

equipmentOffset = ((sprite == spriteRun) and
                (floor(animationImage) mod 2) == 0)
               and onground;
equipmentOffset *= -2; // two pixels up for whether the sprite is bobbing(above expression gives one down)

overlayOffset = equipmentOffset;

if ((player.class == CLASS_HEAVY and abs(hspeed) < 3) or player.class == CLASS_SOLDIER or noNewAnim or taunting)
{
    equipmentOffset = 0; // override run bob for classes with no run bob
    overlayOffset = 0;
}
else if (abs(hspeed) < 3 and equipmentOffset = -2 and !taunting)
{
    equipmentOffset += 2;
    yr += 2;
    overlayOffset = equipmentOffset-2; // mad because overlays use yr
}
else
    overlayOffset = equipmentOffset;

if(!noNewAnim) // quote and sniper zoom still use the old anim system so animationOffset is still set, override it here for everything else
    animationOffset = 0;


equipmentOffset += yoffset;

yr += yoffset;

if (omnomnomnom)
{
    draw_sprite_ext_overlay(omnomnomnomSprite,omnomnomnomOverlays,gearList,omnomnomnomindex,xr,yr,image_xscale,image_yscale,image_angle,c_white,1);
    if (ubered)
        draw_sprite_ext_overlay(omnomnomnomSprite,omnomnomnomOverlays,gearList,omnomnomnomindex,xr,yr,image_xscale,image_yscale,image_angle,ubercolour,0.7);
}
else if (taunting)
{
    draw_sprite_ext_overlay(tauntsprite,tauntOverlays,gearList,tauntindex,xr,yr,image_xscale,image_yscale,image_angle,c_white,1);
    if (ubered)
        draw_sprite_ext_overlay(tauntsprite,tauntOverlays,gearList,tauntindex,xr,yr,image_xscale,image_yscale,image_angle,ubercolour,0.7);
}
else if (player.humiliated)
    draw_sprite_ext(humiliationPoses,floor(animationImage)+humiliationOffset,xr,yr,image_xscale,image_yscale,image_angle,c_white,image_alpha);
else if (!taunting)
{
    if (intel and player.class != CLASS_QUOTE and !zoomed)
        draw_sprite_ext(spriteIntel,0,xr,round(y)+equipmentOffset, image_xscale, image_yscale, 0, c_white, image_alpha);
    if (zoomed)
        overlayOffset += 4;
    if (cloak)
    {
        if (!ubered)
            draw_sprite_ext_overlay(sprite,-1,gearList,animationImage+animationOffset,xr,yr,image_xscale,image_yscale,image_angle,c_white,image_alpha);
        else if (ubered)
        {
            draw_sprite_ext_overlay(sprite,-1,gearList,animationImage+animationOffset,xr,yr,image_xscale,image_yscale,image_angle,c_white,1);
            draw_sprite_ext_overlay(sprite,-1,gearList,animationImage+animationOffset,xr,yr,image_xscale,image_yscale,image_angle,ubercolour,0.7);
        }
    }
    else
    {
        if (!ubered)
            draw_sprite_ext_overlay(sprite,overlayList,gearList,animationImage+animationOffset,xr,yr,image_xscale,image_yscale,image_angle,c_white,image_alpha,overlayOffset);
        else if (ubered)
        {
            draw_sprite_ext_overlay(sprite,overlayList,gearList,animationImage+animationOffset,xr,yr,image_xscale,image_yscale,image_angle,c_white,1,overlayOffset);
            draw_sprite_ext_overlay(sprite,overlayList,gearList,animationImage+animationOffset,xr,yr,image_xscale,image_yscale,image_angle,ubercolour,0.7,overlayOffset);
        }
    }
}

if (burnDuration > 0 or burnIntensity > 0)
{
    for(i = 0; i < realnumflames; i += 1)
    {
        draw_sprite_ext(FlameS, (alarm[5] * global.delta_factor) + i + random(2), x + flameArray_x[i], y + flameArray_y[i], 1, 1, 0, c_white, burnIntensity / maxIntensity * 0.5 + 0.25);
    }  
}

//Domination Indicator
if (domination_kills_get(player.dominationKills, global.myself) > 3)
    draw_sprite_ext(DominationS, player.team, xr, yr-35, 1, 1, 0, c_white, cloakAlpha);

if (distance_to_point(mouse_x, mouse_y) < 25)
{
    if (cloak and team != global.myself.team)
        exit;
    draw_set_alpha(1);
    if(team == TEAM_RED)
        draw_set_color(c_red);
    else
        draw_set_color(c_blue);
    
    var width, height;
    width = name_width_badges(player);
    height = string_height(string_hash_to_newline(sanitiseNewlines(player.name)));
    
    draw_name_badges(round(xr - width / 2), round(y) - 35 - height, player, 1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
    if(team == global.myself.team && global.showTeammateStats)
    {
        if(weapons[0] == Medigun)
            draw_text(xr,round(y)+50, string_hash_to_newline("Superburst: " + string(currentWeapon.uberCharge/20) + "%"));
        else if(weapons[0] == Shotgun)
            draw_text(xr,round(y)+50, string_hash_to_newline("Nuts 'N' Bolts: " + string(nutsNBolts)));
        else if(weapons[0] == Minegun)
            draw_text(xr,round(y)+50, string_hash_to_newline("Lobbed Mines: " + string(currentWeapon.lobbed)));
    }
}

// Copied from Lorgan's itemserver "angels" with slight modifications
// All credit be upon him
if (demon != -1)
{
    demonX = median(x-40,demonX,x+40);
    demonY = median(y-40,demonY,y);
    demonOffset += demonDir;
    if (abs(demonOffset) > 15)
        demonDir *= -1;

    var dir;
    if (demonX > x)
        dir = -1;
    else
        dir = 1;

    if (demonFrame > sprite_get_number(demon))
        demonFrame = 0;

    if (stabbing || ubered)
        draw_sprite_ext(demon,demonFrame+floor(animationImage)+7*player.team,demonX,demonY+demonOffset,dir*1,1,0,c_white,1);
    else
        draw_sprite_ext(demon,demonFrame+floor(animationImage)+7*player.team,demonX,demonY+demonOffset,dir*1,1,0,c_white,image_alpha);

    demonFrame += 1;
}

