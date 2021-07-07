if(!variable_local_exists("baseybegin")) // This needs to be duplicated because of code execution order issues
{
    baseybegin = ybegin;
    mouse_samples = ds_list_create();
}
if(__view_get( e__VW.HView, 0 ) < 600)
{
    ds_list_add(mouse_samples, window_mouse_get_y());
    while(ds_list_size(mouse_samples) > 10)
        ds_list_delete(mouse_samples, 0);
    var des_y;
    des_y = 0;
    for(i = 0; i < ds_list_size(mouse_samples); i += 1)
        des_y += ds_list_find_value(mouse_samples, i);
    des_y /= ds_list_size(mouse_samples);
    
    ybegin = round(baseybegin
                   - min(1, max(0, des_y/__view_get( e__VW.HView, 0 )))
                     *(600-__view_get( e__VW.HView, 0 )));
}
{
    var i, val, gotVar, itemx, itemy, itemcount;
    menu_hack_backbutton();
    itemcount = menu_get_itemcount();
    
    if (dimmed)
    {   
        draw_set_color(c_black);
        draw_set_alpha(0.71);
        draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ), false);   
    }
    if (!dimmed and menumode and drawbg)
    {
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        
        draw_pinched_blackrect(__view_get( e__VW.XView, 0 ) + xbegin - bgoffsetx - 8,
                               __view_get( e__VW.YView, 0 ) + ybegin - bgoffsety - 8,
                               bgwidth + 16, (itemcount-1)*spacing + bgheight + 16,
                               bginset, 4);
        
        draw_set_alpha(1);
    }
    
    // Dead block of state setters?
    draw_set_color(c_white);

    draw_set_valign(fa_middle);
    draw_set_halign(fa_left);
    draw_set_alpha(1);
    
    itemy = __view_get( e__VW.YView, 0 )+ybegin-taboffset;
    for(i=0; i<tabs; i+=1)
    {
        itemx = __view_get( e__VW.XView, 0 )+xbegin+i*tabspacing+tabmargin;
        
        if(bgtabs)
        {
            draw_set_color(c_black);
            draw_set_alpha(0.5);
            
            draw_pinched_blackrect(itemx-bgoffsetx, itemy-bgoffsety, tabspacing-8, bgheight, bginset, bgbezel);
            
            draw_set_alpha(1);
        }
        
        if(i == -2-virtualitem and !editing)
            draw_set_color(c_red);
        else
            draw_set_color(c_white);
        
        draw_text(itemx, itemy, string_hash_to_newline(tab_name[i]));
    }
    
    itemx = __view_get( e__VW.XView, 0 )+xbegin;
    for (i = 0; i < itemcount; i += 1)
    {
        itemy = __view_get( e__VW.YView, 0 )+ybegin+i*spacing;
        if(drawbg)
        {
            draw_set_color(c_black);
            draw_set_alpha(0.5);
            
            draw_pinched_blackrect(itemx - bgoffsetx, itemy - bgoffsety, bgwidth, bgheight, bginset, bgbezel);
            
            draw_set_alpha(1);
        }
    
        if (editing == i)
            draw_set_color(c_orange);
        else if(i == virtualitem and getsHighlight)
            draw_set_color(c_red);
        else
            draw_set_color(c_white);

        draw_text(__view_get( e__VW.XView, 0 )+xbegin,__view_get( e__VW.YView, 0 )+ybegin+i*spacing,string_hash_to_newline(item_name[i]));
        
        switch (item_type[i])
        {
        case "script":
            val = "";
            break;
        
        case "editscript":
        case "edittext2":
        case "edittext":
        case "editnum":
            val = item_value[i];
            break;
        
        case "editselect":
            val = item_option_label[i, item_value[i]];
            break;
        
        case "editkey":
            if (editing == i)
            {
                val = "Please press a key";
                break;
            }
        case "editkeyormouse":
            if (editing == i)
            {
                val = "Please press a key or mouse button";
                break;
            }
            switch (menu_get_var(i))
            {
            case vk_alt:
                val = "Alt";
                break;
            case vk_control:
                val = "Control";
                break;
            case vk_down:
                val = "Down";
                break;
            case vk_up:
                val = "Up";
                break;
            case vk_left:
                val = "Left";
                break;
            case vk_right:
                val = "Right";
                break;
            case vk_enter:
                val = "Enter";
                break;
            case vk_tab:
                val = "Tab";
                break;
            case vk_space:
                val = "Space Bar";
                break;
            case vk_shift:
                val = "Shift";
                break;
            case MOUSE_LEFT:
                val = "Left Mouse Button";
                break;
            case MOUSE_RIGHT:
                val = "Right Mouse Button";
                break;
            default:
                gotVar = menu_get_var(i);
                //Numpad number buttons
                if (gotVar >= 96 && gotVar <=  105){
                    val = "NUMPAD " + chr(gotVar - 48);
                }
                //Numpad other buttons
                else if (gotVar >= 106 && gotVar <=  111){
                    val = "NUMPAD " + chr(gotVar - 64);
                }
                //Function buttons
                else if (gotVar >= 112 && gotVar <= 123) {
                    val = "F" + string(gotVar - 111);
                }
                //Comma, dot, minus
                else if (gotVar >= 188 && gotVar <= 190) {
                    val = chr(gotVar - 144);
                }
                else val = chr(menu_get_var(i));
                break;
            }
            break;
        }
        draw_text(__view_get( e__VW.XView, 0 )+xbegin+valueoffset,__view_get( e__VW.YView, 0 )+ybegin+i*spacing,string_hash_to_newline(sanitiseNewlines(val)));
    }
}

