if(healed){
    xoffset = __view_get( e__VW.XView, 0 );
    yoffset = __view_get( e__VW.YView, 0 );
    mid = __view_get( e__VW.WView, 0 )/2;

    HUDwidth = string_width(string_hash_to_newline("Healer: " + sanitiseNewlines(healer)))+20;
    
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_set_alpha(.5);
    
    drawy = yoffset+__view_get( e__VW.HView, 0 )-150;
    if(instance_exists(HealingHud))
        if(instance_exists(HealingHud.target))
            drawy = yoffset+__view_get( e__VW.HView, 0 )-110;
        
    draw_sprite_stretched_ext(sprite_index, global.myself.team == TEAM_BLUE, 
        xoffset+mid-(HUDwidth/2)+20, drawy, HUDwidth, 36, c_white, 1);
    draw_text_color(xoffset+mid+20, drawy+12, string_hash_to_newline("Healer: " + sanitiseNewlines(healer)), c_white, c_white, c_white, c_white, 1);    
    draw_healthbar(xoffset+mid-(HUDwidth/2)-24, drawy+2,xoffset+mid-(HUDwidth/2)+20, drawy+34,healerhp*100/120,c_black,c_white,c_white,3,true,false);
    draw_healthbar(xoffset+mid-(HUDwidth/2)+30, drawy+20, xoffset+mid+HUDwidth/2+10, drawy+28, healerUberCharge*100/2000,c_black,c_white,c_white,0,true,true);
    draw_sprite_stretched_ext(HealedHudHPS, global.myself.team == TEAM_BLUE,
        xoffset+mid-(HUDwidth/2)-26, drawy,48,36,c_white, 1);
    draw_sprite_stretched_ext(HealedHudCapS, global.myself.team == TEAM_BLUE,
        xoffset+mid+(HUDwidth/2)+18, drawy,6,36,c_white, 1);
    draw_text_color(xoffset+mid-(HUDwidth/2)-2, drawy+18, string_hash_to_newline(healerhp), c_white, c_white, c_white, c_white, 1);
}

