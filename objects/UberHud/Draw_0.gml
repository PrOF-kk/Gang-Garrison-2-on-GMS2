    if (global.myself.object = -1 or global.myself.class != CLASS_MEDIC)
    {
        instance_destroy();
        exit;
    }
    xoffset = __view_get( e__VW.XView, 0 );
    yoffset = __view_get( e__VW.YView, 0 );
    xsize = __view_get( e__VW.WView, 0 );
    ysize = __view_get( e__VW.HView, 0 );
    if (global.myself.team == TEAM_BLUE)
        uberoffset=1;
    else
        uberoffset = 0;
    
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    draw_set_alpha(1);

    var myMedigun;
    myMedigun = -1;
    with(Medigun)
    {
        if(ownerPlayer == global.myself)
            myMedigun = id;
    }
    if(myMedigun != -1)
    {
        draw_healthbar(xoffset+xsize-135, yoffset+ysize-100, xoffset+xsize-15, yoffset+ysize-68,myMedigun.uberCharge*100/2000,c_black,c_white,c_white,0,true,true);
        draw_sprite_ext(UberHudS,uberoffset,xoffset+xsize-80,yoffset+ysize-85,2,2,0,c_white,1);
        draw_text_color(xoffset+xsize-70,yoffset+ysize-90,string_hash_to_newline("SUPERBURST"),c_white,c_white,c_white,c_white,1);
    }

