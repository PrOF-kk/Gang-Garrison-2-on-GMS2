xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

if instance_exists(WinBanner) with WinBanner instance_destroy();

global.totalControlPoints = 1;
global.cp[0] = ArenaControlPoint.id;
drawControlPointStatus(cpUnlock);

xshift = -320*global.timerPos;
yshift = 5*global.timerPos;

draw_roundtimer(xoffset, yoffset, xsize, ysize, timer);

draw_set_halign(fa_center); 
if (state == ARENA_STATE_ROUND_SETUP)
{
    draw_text(xoffset+xsize/2, yoffset+ysize/2 + 100, string_hash_to_newline("Game will start in "+string(ceil(roundStart/30))+" seconds"));
}

if (state == ARENA_STATE_WAITING)
{
    draw_text(xoffset+xsize/2, yoffset+ysize/2 + 100, string_hash_to_newline("Waiting for players..."));
}

if (global.myself != -1)
{
    if (global.myself.object == -1 and state == ARENA_STATE_ROUND_PROPER
        and !overtime and global.winners == -1 and !instance_exists(DeathCam)
        and global.myself.team != TEAM_SPECTATOR)
        draw_text(xoffset+xsize/2, yoffset+ysize/2 + 100, string_hash_to_newline("You will spawn when the next round starts"));
    
    //Alive players remaining 
    draw_set_color(c_white);
    draw_sprite_ext(ArenaPlayerCountS, 0, xoffset+xsize/2, yoffset+71, 2, 2, 0, c_white, 1);
    draw_text(xoffset+xsize/2-22, yoffset+73, string_hash_to_newline(redteamCharacters));
    draw_text(xoffset+xsize/2+22, yoffset+73, string_hash_to_newline(blueteamCharacters));
}
 
//MVPs
if (state == ARENA_STATE_ROUND_END and global.winners == -1 and !instance_exists(ScoreTableController))
{
    with (DeathCam) instance_destroy();
    
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_color(c_white);

    // Note: There is always a winner on round end. If that changes, this code needs to adapt
    var mvpSubimg, mvpTeam;
    if (winners == TEAM_RED)
    {
        if (endCount > 150)
        {
            mvpSubimg = 0;
            mvpTeam = TEAM_RED;
        }
        else
        {
            mvpSubimg = 1;
            mvpTeam = TEAM_BLUE;        
        }
    }
    else
    {
        if (endCount > 150)
        {
            mvpSubimg = 2;
            mvpTeam = TEAM_BLUE;
        }
        else
        {
            mvpSubimg = 3;
            mvpTeam = TEAM_RED;
        }
    }

    draw_sprite_ext(MVPBannerS, mvpSubimg, xoffset+xsize/2, yoffset+ysize/2, 2, 2, 0, c_white, 0.8);
    
    if(variable_local_exists("mvps"))
    {
        // The mvps don't exist for players who join during round end, since syncing them in the FULL_UPDATE
        // would make things more complicated, and it should happen rarely enough that seeing an empty
        // MVP board won't be too annoying.
        
        var mvpXOffset, i;
        mvpXOffset = xoffset+xsize/2;
        for (i=0; i < mvps[mvpTeam]; i+=1)
        {
            var mvpYOffset;
            mvpYOffset = yoffset+ysize/2+76 + 15*i;
            draw_text(mvpXOffset-250, mvpYOffset, string_hash_to_newline(mvpName  [mvpTeam,i]));
            draw_text(mvpXOffset- 30, mvpYOffset, string_hash_to_newline(mvpKills [mvpTeam,i]));
            draw_text(mvpXOffset+122, mvpYOffset, string_hash_to_newline(mvpHealed[mvpTeam,i]));
            draw_text(mvpXOffset+248, mvpYOffset, string_hash_to_newline(mvpPoints[mvpTeam,i]));
        }
    }
    
    draw_set_color(make_color_rgb(227, 226, 225));
    draw_set_halign(fa_right);
    draw_text_transformed(xoffset+xsize/2-50, yoffset+ysize/2-90, string_hash_to_newline(redWins), 4, 4, 0);
    draw_set_halign(fa_left);
    draw_text_transformed(xoffset+xsize/2+50, yoffset+ysize/2-90, string_hash_to_newline(blueWins), 4, 4, 0);

}
 

