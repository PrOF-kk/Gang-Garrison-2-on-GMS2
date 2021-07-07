    xoffset = __view_get( e__VW.XView, 0 );
    yoffset = __view_get( e__VW.YView, 0 );
    xsize = __view_get( e__VW.WView, 0 );
    ysize = __view_get( e__VW.HView, 0 );
    xshift = -320*global.timerPos;
    yshift = 5*global.timerPos;
    var bluedir;

    if (global.myself == -1)
        exit;
    
    draw_set_alpha(1);
    
    draw_sprite_ext(sprite_index, 0, xoffset+xsize/2, yoffset+ysize, 3, 3, 0, c_white, 1);

    draw_set_color(c_black);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);

    //showing the amount of caps, and the amount of caps to win
    draw_text_transformed(xoffset+xsize/2-64, yoffset+ysize-30, string_hash_to_newline(string(global.redCaps)),2,2,0);
    
    caplimitxoffset = 54;
    // this next piece of code helps to resize the value of the numbers depending on the limit as not to overflow
    if (global.caplimit <= 9)
    {
        draw_text_transformed(xoffset+xsize/2-2+caplimitxoffset, yoffset+ysize-15, string_hash_to_newline(string(global.caplimit)),2,2,0);
    }
    else
    {
        if (global.caplimit > 999)
        {
            draw_sprite_ext(infinity,0,xoffset+xsize/2-3+caplimitxoffset, yoffset+ysize-17, 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_text(xoffset+xsize/2-2, yoffset+ysize-15+caplimitxoffset, string_hash_to_newline(string(global.caplimit)));   
        }
    }
    
    //Drawing intel status and arrows:
    
    bluex=(xoffset+xsize/2)-1;
    bluey=(yoffset+ysize)-51;
    
    // Point to the intel if it's on the field
    if (instance_exists(IntelligenceBlue))
    {
        bluedir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2, IntelligenceBlue.x, IntelligenceBlue.y);
        if (IntelligenceBlue.alarm[0] <= 0)
            blueintelstatus=2;
        else
            blueintelstatus=0;
    }
    // Someone's carrying it
    else
    {
        // If we're carrying it, it should point where we need to go
        bluedir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2, IntelligenceBaseRed.x, IntelligenceBaseRed.y);
        with(Character)
        {
            // Otherwise it whould point at the person who's carrying it
            if (team == TEAM_RED and intel and id != global.myself.object)
                bluedir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2, x, y);
        }
        blueintelstatus=1;
    }
    
    if (global.myself.object != -1)
    {
        if (global.myself.team == TEAM_RED and global.myself.object.intel)
            blueintelstatus = 3;
    }
    
    if (blueintelstatus == 0)
        draw_sprite_ext(IntelReturnTimeS,max(1,floor(IntelligenceBlue.alarm[0]/900*17*global.delta_factor)),bluex-26,bluey-27,3,3,0,c_white,1);
    else
        draw_sprite_ext(IntelReturnTimeS,16,bluex-26,bluey-27,3,3,0,c_white,1);
    
    draw_sprite_ext(IntelArrowS, 1, bluex, bluey, 3, 3, bluedir, c_white, 1);
    
    draw_sprite_ext(IntelStatusS, blueintelstatus, bluex, bluey, 2, 2, 0, c_white, 1);
    
    draw_roundtimer(xoffset, yoffset, xsize, ysize, timer);

