{
    var xoffset, yoffset, xsize, ysize, i, player, redteam, blueteam, spec, domCount;
    
    xoffset = __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2-280;
    yoffset = __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2-190;
    xsize = 800/5*3;
    ysize = 600/5*3;
    xcenter = __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2;
    
    draw_sprite_ext(Scoreboard, 0, xoffset, yoffset, 1, 1, 0, c_white, alpha*0.8);

    draw_set_alpha(alpha);
    draw_set_color(c_white);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
        
    redteam = ds_priority_create();
    blueteam = ds_priority_create();  
    spec = ds_priority_create();
    
    for(i=0; i<ds_list_size(global.players); i+=1)
    {
        player = ds_list_find_value(global.players, i);
        
        if(player.team == TEAM_RED)
            ds_priority_add(redteam, player, player.stats[POINTS]);
        else if (player.team == TEAM_BLUE)
            ds_priority_add(blueteam, player, player.stats[POINTS]);
        else if (player.team == TEAM_SPECTATOR)
            ds_priority_add(spec, player, 1);
    }
    
    with(JoiningPlayer)
    {
        if(occupiesSlot)
            ds_priority_add(spec, id, 0);
    }
    
    draw_set_color(make_color_rgb(227,226,225));
    draw_set_halign(fa_right);
    draw_set_font(global.countFont);
    draw_text_transformed(xcenter-(400-239),yoffset+23,string_hash_to_newline(ds_priority_size(redteam)),1,1,0);
    draw_text_transformed(xcenter-(400-483),yoffset+23,string_hash_to_newline(ds_priority_size(blueteam)),1,1,0);
    draw_set_font(global.gg2Font);
    
    if instance_exists(CTFHUD)
    {
        draw_text_transformed(xcenter-(400-384),yoffset,string_hash_to_newline(global.redCaps),4,4,0);
        draw_set_halign(fa_left);
        draw_text_transformed(xcenter-(400-412),yoffset,string_hash_to_newline(global.blueCaps),4,4,0);
    }
    else if instance_exists(ArenaHUD)
    {
        draw_text_transformed(xcenter-(400-384),yoffset,string_hash_to_newline(ArenaHUD.redWins),4,4,0);
        draw_set_halign(fa_left);
        draw_text_transformed(xcenter-(400-412),yoffset,string_hash_to_newline(ArenaHUD.blueWins),4,4,0);
    }
    
    for(i=0; ds_priority_size(redteam) > 0; i += 1) {
        player = ds_priority_delete_max(redteam);
        
        if (i < 12)
        {
            draw_set_color(c_red);
            if (showadmin and player != global.myself)
            {
                var _x, _y;
                _x = xoffset+6;
                _y = yoffset+70+20*(i+1);
                draw_sprite_ext(Boot,0,_x,_y,1,1,0,c_white,alpha);
                if (mouse_x >= _x and mouse_x < _x+16
                    and mouse_y >= _y and mouse_y < _y+16)
                {
                    draw_sprite_ext(Boot,0,_x,_y,1,1,0,c_red,alpha*0.5);
                    if (mouse_check_button_pressed(mb_left)) {
                        mouse_clear(mb_left);
                        player.kicked = true;
                    }        
                }
            }
            else
            {
                if (global.myself.team == player.team or global.mapchanging)
                {
                    draw_sprite_ext(Icon,player.class,xoffset+14,yoffset+70+20*(i+1),1,1,0,c_white,alpha);
                    draw_sprite_ext(Icon,player.class,xoffset+14,yoffset+70+20*(i+1),1,1,0,c_red,alpha*0.2);
                }
            }
            
            //Highlight self
            if (player == global.myself)
                draw_set_color(make_color_rgb(255,101,0));
            else
                draw_set_color(c_red);
            
            draw_name_badges(xoffset+28, yoffset+70+20*(i+1), player, alpha);
        
            draw_set_halign(fa_right);
            draw_text(xoffset+xsize/2-15, yoffset+70+20*(i+1), string_hash_to_newline(string(floor(player.stats[POINTS]))));
            
            //Domination Medals
            domCount = domination_kills_getDomCount(player);
            if (domCount > 0) {
                draw_sprite_ext(MedalS, 0, xoffset+xsize/2-5, yoffset+70+20*(i+1), 1, 1, 0, c_white, alpha);
                draw_set_color(make_color_rgb(227, 226, 225));
                draw_text_transformed(xoffset+xsize/2 + 12, yoffset+70+20*(i+1), string_hash_to_newline(string(domCount)), 1, 1, 0);
            }
            //Dominated player
            if (domination_kills_get(global.myself.dominationKills, player) > 3)
                draw_sprite_ext(MedalS, 3, xoffset+xsize/2 + 15, yoffset+70+20*(i+1), 1, 1, 0, c_white, alpha);
            //Nemesis
            else if (domination_kills_get(player.dominationKills, global.myself) > 3)
                draw_sprite_ext(MedalS, 5, xoffset+xsize + 55, yoffset+70+20*(i+1), 1, 1, 0, c_white, alpha);
            
            if(player.object == -1)
                draw_sprite_ext(DeadS, 0, xoffset+195, yoffset+75+20*(i+1), 1, 1, 0, c_white, alpha);
        }          
    }
    
    for(i=0; ds_priority_size(blueteam) > 0; i+=1) {
        player = ds_priority_delete_max(blueteam);

        if (i < 12){
            draw_set_color(c_blue);
            if (showadmin && player != global.myself) {
                var _x, _y;
                _x = xoffset+xsize/2+44;
                _y = yoffset+70+20*(i+1);
                draw_sprite_ext(Boot,0,_x,_y,1,1,0,c_white,alpha);
                if (mouse_x >= _x and mouse_x < _x+16
                    and mouse_y >= _y and mouse_y < _y+16)
                {
                    draw_sprite_ext(Boot,0,_x,_y,1,1,0,c_red,alpha*0.5);
                    if (mouse_check_button_pressed(mb_left)) {
                        mouse_clear(mb_left);
                        player.kicked = true;
                    }        
                }
            } else {
                if(global.myself.team == player.team) {
                    draw_sprite_ext(Icon,player.class,xoffset+xsize/2+49,yoffset+70+20*(i+1),1,1,0,c_white,alpha);
                    draw_sprite_ext(Icon,player.class,xoffset+xsize/2+49,yoffset+70+20*(i+1),1,1,0,c_blue,alpha*0.2);
                }
            }
            
            //Highlight self
            if (player == global.myself)
                draw_set_color(make_color_rgb(0,113,255));
            else
                draw_set_color(c_blue);
            
            draw_name_badges(xoffset+xsize/2+60, yoffset+70+20*(i+1), player, alpha);
            
            draw_set_halign(fa_right);
            draw_text(xoffset+xsize+25, yoffset+70+20*(i+1), string_hash_to_newline(string(floor(player.stats[POINTS]))));
            
            //Domination Medals
            domCount = domination_kills_getDomCount(player);
            if (domCount > 0) {
                draw_sprite_ext(MedalS, 0, xoffset+xsize + 35, yoffset+70+20*(i+1), 1, 1, 0, c_white, alpha);
                draw_set_color(make_color_rgb(227, 226, 225));
                draw_text_transformed(xoffset+xsize + 52, yoffset+70+20*(i+1), string_hash_to_newline(string(domCount)), 1, 1, 0);
            }
            //Dominated player
            if (domination_kills_get(global.myself.dominationKills, player) > 3)
                draw_sprite_ext(MedalS, 3, xoffset+xsize + 55, yoffset+70+20*(i+1), 1, 1, 0, c_white, alpha);
            //Nemesis
            else if (domination_kills_get(player.dominationKills, global.myself) > 3)
                draw_sprite_ext(MedalS, 6, xoffset+xsize + 55, yoffset+70+20*(i+1), 1, 1, 0, c_white, alpha);
                     
            if (player.object == -1)
                draw_sprite_ext(DeadS, 0, xoffset+472, yoffset+75+20*(i+1), 1, 1, 0, c_white, alpha);
        
        }
    }
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    
    // Spectator printing code 
    
    draw_text(xoffset+xsize-475, yoffset+370,string_hash_to_newline((string(ds_priority_size(spec))) + " spectator(s): "));    
    
    specList="";
    
    var __x, __y, __x_max, __bootlen, __str, nameWidth;
    
    __y = yoffset+370;
    __x_min = xoffset+xsize-350;
    __x_max = xoffset+xsize + 50;
    __x = __x_min;
    __bootlen = 0;
    for(i=0; ds_priority_size(spec) > 0; i+=1) {
        player = ds_priority_delete_max(spec);
        
        if (showadmin && player != global.myself) {
            var _x, _y;
            _x = __x;
            _y = __y;
            __bootlen = 16;
            draw_sprite_ext(Boot,0,_x,_y,1,1,0,c_white,alpha);
            if (mouse_x >= _x and mouse_x < _x+16
                and mouse_y >= _y and mouse_y < _y+16)
            {
                draw_sprite_ext(Boot,0,_x,_y,1,1,0,c_red,alpha*0.5);
                if (mouse_check_button_pressed(mb_left)) {
                    mouse_clear(mb_left);
                    player.kicked = true;
                }
            }
        }
        
        if (ds_priority_size(spec) == 0)
        {
            __str = "";
        }
        else
        {
            __str = ", ";
        }
        
        if(player.object_index == JoiningPlayer)
            nameWidth = string_width(string_hash_to_newline("["+sanitiseNewlines(player.name)+"]"));
        else
            nameWidth = name_width_badges(player);
        
        if (__bootlen + __x + nameWidth + string_length(__str) > __x_max) {
            __x = __x_min;
            __y += string_height(string_hash_to_newline("/|ijgyA[")) + 2;
        }
        
        if(player.object_index == JoiningPlayer)
            draw_text(__bootlen + __x, __y, string_hash_to_newline("["+sanitiseNewlines(player.name)+"]"));
        else
            draw_name_badges(__bootlen + __x, __y, player, alpha);
                        
        __x += __bootlen + nameWidth;
        draw_text(__x, __y, string_hash_to_newline(__str));
        __x += string_width(string_hash_to_newline(__str));
    }
    
    draw_text(xoffset + 8, yoffset+48, string_hash_to_newline("Server: " + sanitiseNewlines(string_copy(global.joinedServerName,1,25))));
    draw_text(xoffset+xsize/2+16, yoffset+48, string_hash_to_newline("    Map: " + sanitiseNewlines(string_copy(global.currentMap,1,25))));
    
    ds_priority_destroy(redteam);
    ds_priority_destroy(blueteam);
    ds_priority_destroy(spec);
}

