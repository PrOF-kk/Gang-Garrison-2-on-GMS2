xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

// special thanks to wareya for the warhud HP cross code & images
var sprite_xpos, sprite_ypos, icon_xpos, icon_ypos, hppixels;

draw_set_alpha(1);
draw_rectangle_color(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+xsize,__view_get( e__VW.YView, 0 )+20,c_black,c_black,c_black,c_black,0);
draw_rectangle_color(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+ysize-20,__view_get( e__VW.XView, 0 )+xsize,__view_get( e__VW.YView, 0 )+ysize,c_black,c_black,c_black,c_black,0);

draw_set_color(c_white);
if (tracking)
{
    draw_name_badges(xoffset+50, yoffset+ysize-16, player, 1);
    if (player.object == -1)
        exit;
    if (global.myself.team == TEAM_SPECTATOR and player.object.maxHp != 0)
    {
        sprite_xpos = -2;
        sprite_ypos = ysize-62;
        icon_xpos = sprite_xpos;
        icon_ypos = sprite_ypos + 20;
        draw_sprite_ext(SpectatorHealthCross, 0, xoffset+sprite_xpos, yoffset+sprite_ypos, 2, 2, 0, c_white, 1);
        hppixels = player.object.hp/player.object.maxHp*17;
        draw_sprite_part_ext(SpectatorHealthFill,0,0,(17-hppixels)+10,43,hppixels+1,xoffset+icon_xpos, yoffset+icon_ypos+(17-hppixels)*2,2,2,c_red,1);
        draw_sprite_part_ext(SpectatorHealthFill,0,0,(17-hppixels)+10,43,hppixels+1,xoffset+icon_xpos, yoffset+icon_ypos+(17-hppixels)*2,2,2,c_green,player.object.hp/player.object.maxHp);
    }
    draw_sprite(SpectatorCrosshairS, player.team,
                round(player.object.x) + cos(degtorad(player.object.aimDirection))*player.object.aimDistance,
                round(player.object.y) - sin(degtorad(player.object.aimDirection))*player.object.aimDistance);
    
}

if (global.myself != -1)
{
    if ((global.myself.alarm[5] > 0) and (global.myself.team != TEAM_SPECTATOR))
    {
        draw_set_valign(fa_center);
        draw_set_halign(fa_left);
        if (!instance_exists(ArenaHUD))
            draw_text(xoffset+10, yoffset+10,string_hash_to_newline("Respawn in " +string(ceil(global.myself.alarm[5]/30*global.delta_factor))+ " second(s)."))
        else
            draw_text(xoffset+10, yoffset+10,string_hash_to_newline("No Respawning in Arena"));
    }
}

