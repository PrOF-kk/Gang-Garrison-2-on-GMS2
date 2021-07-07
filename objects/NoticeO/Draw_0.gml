{

    if instance_exists(DeathCam) exit;

    var xoffset, yoffset, xsize, ysize, i, player, redteam, blueteam;
    
    xoffset = __view_get( e__VW.XView, 0 );
    yoffset = __view_get( e__VW.YView, 0 );
    xsize = __view_get( e__VW.WView, 0 );
    ysize = __view_get( e__VW.HView, 0 );
    
    draw_set_alpha(alpha);
      
    draw_rectangle_color(xoffset, (yoffset+ysize)-110, (xoffset+xsize), (yoffset+ysize)-92, c_black,c_black,c_black,c_black,0);
     
    draw_sprite_ext(GameNoticeS, 0, xoffset+25, yoffset+ysize-100, 2, 2, 0, c_white, alpha);
    
    draw_set_color(c_white);
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    
    if notice == NOTICE_NUTSNBOLTS draw_text_ext_color(xoffset+50, (yoffset+ysize)-100,string_hash_to_newline("Not enough Nuts 'N' Bolts to build!"),-1,-1,c_white,c_white,c_white,c_white,alpha);
    else if notice == NOTICE_TOOCLOSE draw_text_ext_color(xoffset+50, (yoffset+ysize)-100,string_hash_to_newline("Cannot build this close to another building!"),-1,-1,c_white,c_white,c_white,c_white,alpha);
    else if notice == NOTICE_AUTOGUNSCRAPPED draw_text_ext_color(xoffset+50, (yoffset+ysize)-100,string_hash_to_newline("Autogun scrapped!"),-1,-1,c_white,c_white,c_white,c_white,alpha);    
    else if notice == NOTICE_HAVEINTEL draw_text_ext_color(xoffset+50, (yoffset+ysize)-100,string_hash_to_newline("You have the intelligence!"),-1,-1,c_white,c_white,c_white,c_white,alpha);    
    else if notice == NOTICE_SETCHECKPOINT draw_text_ext_color(xoffset+50, (yoffset+ysize)-100, string_hash_to_newline("Checkpoint set at this location!"), -1,-1,c_white,c_white,c_white,c_white,alpha);
    else if notice == NOTICE_DESTROYCHECKPOINT draw_text_ext_color(xoffset+50, (yoffset+ysize)-100, string_hash_to_newline("Checkpoint destroyed at this location!"), -1,-1,c_white,c_white,c_white,c_white,alpha);
    else if notice == NOTICE_CUSTOM draw_text_ext_color(xoffset+50, (yoffset+ysize)-100, string_hash_to_newline(message), -1,-1,c_white,c_white,c_white,c_white,alpha);
}

