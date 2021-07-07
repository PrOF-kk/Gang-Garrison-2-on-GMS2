if (instance_exists(target))
{
    xsize = __view_get( e__VW.WView, 0 );
    ysize = __view_get( e__VW.HView, 0 );
    xoffset = __view_get( e__VW.XView, 0 );
    yoffset = __view_get( e__VW.YView, 0 )-600+ysize;
    mid = __view_get( e__VW.WView, 0 )/2;
    HUDwidth = string_width(string_hash_to_newline("Healing: " + sanitiseNewlines(target.name)))+20;
    
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_set_alpha(.5);
    if (target.object != -1) {
        draw_sprite_stretched_ext(sprite_index, global.myself.team == TEAM_BLUE, 
        xoffset+mid-(HUDwidth/2)+20, yoffset+450, HUDwidth, 36, c_white, 1);
        draw_text_color(xoffset+mid+20, yoffset+462, string_hash_to_newline("Healing: " + sanitiseNewlines(target.name)), c_white, c_white, c_white, c_white, 1);    
        draw_healthbar(xoffset+mid-(HUDwidth/2)-24, yoffset+452,xoffset+mid-(HUDwidth/2)+20, yoffset+484,floor(target.object.hp*100/target.object.maxHp),c_black,c_white,c_white,3,true,false);
        draw_sprite_stretched_ext(HealedHudHPS, global.myself.team == TEAM_BLUE,
        xoffset+mid-(HUDwidth/2)-26, yoffset+450,48,36,c_white, 1);
        draw_sprite_stretched_ext(HealedHudCapS, global.myself.team == TEAM_BLUE,
        xoffset+mid+(HUDwidth/2)+18, yoffset+450,6,36,c_white, 1);
        draw_text_color(xoffset+mid-(HUDwidth/2)-2, yoffset+468, string_hash_to_newline(floor(target.object.hp)), c_white, c_white, c_white, c_white, 1);
    }
}

