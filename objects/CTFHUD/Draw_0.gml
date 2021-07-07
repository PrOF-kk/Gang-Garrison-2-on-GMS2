
    xoffset = __view_get( e__VW.XView, 0 );
    yoffset = __view_get( e__VW.YView, 0 );
    xsize = __view_get( e__VW.WView, 0 );
    ysize = __view_get( e__VW.HView, 0 );
    xshift = -320*global.timerPos;
    yshift = 5*global.timerPos;
    var reddir, bluedir, redx, redy, bluex, bluey;
    
    if (global.myself == -1)
        exit;
    
    //Drawing intel status and arrows:
    
    redx = xoffset+xsize/2-65;
    redy = yoffset+ysize-50;
    bluex = xoffset+xsize/2+60;
    bluey = yoffset+ysize-50;
    
    draw_set_alpha(1);
    
    draw_sprite_ext(sprite_index, 0, xoffset+xsize/2+1, yoffset+ysize+100, 3, 3, 0, c_white, 1);

    draw_set_color(c_black);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);

    //showing the amount of caps, and the amount of caps to win
    draw_text_transformed(xoffset+xsize/2-135, yoffset+ysize-30, string_hash_to_newline(string(global.redCaps)),2,2,0);
    draw_text_transformed(xoffset+xsize/2+130, yoffset+ysize-30, string_hash_to_newline(string(global.blueCaps)),2,2,0);
    // this next piece of code helps to resize the value of the numbers depending on the limit as not to overflow
    if (global.caplimit <= 9)
    {
        draw_text_transformed(xoffset+xsize/2-2, yoffset+ysize-15, string_hash_to_newline(string(global.caplimit)),2,2,0);
    }
    else
    {
        if (global.caplimit > 999)
        {
            draw_sprite_ext(infinity,0,xoffset+xsize/2-3, yoffset+ysize-17, 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_text(xoffset+xsize/2-2, yoffset+ysize-15, string_hash_to_newline(string(global.caplimit)));   
        }
    }
      
    
    // Point to the intel if it's on the field
    if (instance_exists(IntelligenceRed))
    {
        reddir = point_direction(redx, redy, IntelligenceRed.x, IntelligenceRed.y);
        if (IntelligenceRed.alarm[0] <= 0)
            redintelstatus = 2;
        else
            redintelstatus = 0;
    }
    // Someone's carrying it
    else
    {
        // If we're carrying it, it should point where we need to go
        reddir = point_direction(redx, redy, IntelligenceBaseBlue.x, IntelligenceBaseBlue.y);
        with(Character)
        {
            // Otherwise it whould point at the person who's carrying it
            if (team == TEAM_BLUE and intel and id != global.myself.object)
                reddir = point_direction(redx, redy, x, y);
        }
        redintelstatus=1;
    }
     
    if (instance_exists(IntelligenceBlue))
    {
        bluedir = point_direction(bluex, bluey, IntelligenceBlue.x, IntelligenceBlue.y);
        if (IntelligenceBlue.alarm[0] <= 0)
            blueintelstatus = 2;
        else
            blueintelstatus = 0;
    }
    else
    {
        bluedir = point_direction(bluex, bluey, IntelligenceBaseRed.x, IntelligenceBaseRed.y);
        with(Character)
        {
            if (team == TEAM_RED and intel and id != global.myself.object)
                bluedir = point_direction(bluex, bluey, x, y);
        }
        blueintelstatus=1;
    }
    
    if (global.myself.object != -1) if(global.myself.object.intel)
    {
        if(global.myself.team == TEAM_BLUE)
            redintelstatus = 3;
        if(global.myself.team == TEAM_RED)
            blueintelstatus = 3;
    }
    
    if (blueintelstatus == 0)
        draw_sprite_ext(IntelReturnTimeS,max(1,floor(IntelligenceBlue.alarm[0]/900*17*global.delta_factor)),bluex-26,bluey-27,3,3,0,c_white,1);
    else
        draw_sprite_ext(IntelReturnTimeS,16,bluex-26,bluey-27,3,3,0,c_white,1);
    
    if (redintelstatus == 0)
        draw_sprite_ext(IntelReturnTimeS,max(18,floor(IntelligenceRed.alarm[0]/900*17*global.delta_factor)+17),redx-27,redy-27,3,3,0,c_white,1);
    else
        draw_sprite_ext(IntelReturnTimeS,33,redx-27,redy-27,3,3,0,c_white,1);
    
    draw_sprite_ext(IntelArrowS, 0, redx, redy, 3, 3, reddir, c_white, 1);
    draw_sprite_ext(IntelArrowS, 1, bluex, bluey, 3, 3, bluedir, c_white, 1);
    
    draw_sprite_ext(IntelStatusS, redintelstatus, redx, redy, 2, 2, 0, c_white, 1);
    draw_sprite_ext(IntelStatusS, blueintelstatus, bluex, bluey, 2, 2, 0, c_white, 1);
    
    draw_roundtimer(xoffset, yoffset, xsize, ysize, timer);

