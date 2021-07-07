var i, server;
draw_set_color(c_black);
draw_set_alpha(0.5);

draw_pinched_blackrect(xbegin-8, ybegin-16, width+32, 408, 4, 3);
draw_pinched_blackrect(xbegin-8, ybegin-48, 192, 24, 4, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_valign(fa_top);

/* Let the user know the servers are loading */
if (lobbysocket != -1)
    headerstring = "Loading...";
else
    headerstring = "Servers ("+string(ds_list_size(servers))+"/"+string(numServers)+") ";

draw_text(xbegin, ybegin-41, string_hash_to_newline(headerstring));

for(i=offset; i<ds_list_size(servers) and i<offset+items; i+=1)
{
    var pixeloffset;
    pixeloffset = spacing*(i-offset)-3;
    server = ds_list_find_value(servers, i);
    
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_pinched_blackrect(xbegin, ybegin+pixeloffset-5, width, 32, 4, 1);
    
    draw_set_alpha(1);
    if(i==virtualitem) {
        draw_set_color(c_red);
    } else if(server.compatible) {
        draw_set_color(c_white);
    } else {
        draw_set_color(c_gray);
    }
    
    draw_set_halign(fa_left);
    if(server.private)
        draw_sprite(ControlPointLockS,0,xbegin,ybegin+pixeloffset+5);
    draw_text(xbegin+10, ybegin+pixeloffset,string_hash_to_newline("["+sanitiseNewlines(server.playerstring)+"]"));
    draw_text(xbegin+95, ybegin+pixeloffset,string_hash_to_newline(sanitiseNewlines(server.name)));
    if(ds_map_exists(server.infos, "map"))
        draw_text(xbegin+95,  ybegin+pixeloffset,string_hash_to_newline("#"+sanitiseNewlines(ds_map_find_value(server.infos, "map"))));
    
    draw_set_halign(fa_right);
    draw_text(xbegin+425, ybegin+pixeloffset,string_hash_to_newline(sanitiseNewlines(server.shortgame)));
    
    /* Draw latency and color indicators */
    if(server.pingFinished) {
        docol = c_red;
        showping = string(server.ping);
        if (server.ping < 275) {
            docol = c_yellow;
        }
        if (server.ping < 135) {
            docol = c_green;
        }
        if (server.ping < 75) {
            docol = c_aqua;
        }
        if (server.ping == -1) {
            docol = c_gray;
            showping = "TIMEOUT";
        }

        draw_text_color(xbegin+425, ybegin+pixeloffset,string_hash_to_newline("#"+showping),docol,docol,docol,docol,1);
    }
}

/* */
/*  */
