{
    var oldx, oldy, oldhspeed, oldvspeed, distleft, hleft, vleft;
    oldx=x;
    oldy=y;
    oldhspeed=hspeed;
    oldvspeed=vspeed;
    
    move_outside_solid(0, 8);
    move_outside_solid(180, 16);
    
    if(speed==0) {
        exit;
    }
    move_contact_solid(direction, speed);
    
    distleft = point_distance(x,y,oldx,oldy);
    hleft = oldhspeed-(x-oldx);
    vleft = oldvspeed-(y-oldy);
    
    if(not place_free(x,y+sign(vspeed))) {
        vspeed=0;
        if(not place_free(x+hleft,y)){
            move_contact_solid(direction, abs(hleft));
            hspeed=0;
        } else {
            x+=hleft;
        }
    } else if(not place_free(x+sign(hspeed),y)){
        do {
            if(place_free(x+sign(hspeed),y-6)) {
                y -= 6;
                if(place_free(x+hleft, y)) {
                    x += hleft;
                    hleft=0;
                } else {
                    if(hleft>0) {
                        move_contact_solid(0, abs(hleft));
                    } else {
                        move_contact_solid(180, abs(hleft));
                    }
                    hleft = oldhspeed-(x-oldx);
                }
            } else {
                hspeed=0;
            }
        } until(hspeed==0 or hleft==0);
        if(hspeed==0 and not place_free(x,y+vleft)) {
            show_debug_message(string(direction));
            move_contact_solid(direction, distleft);
            vspeed=0;
        } else {
            y+=vleft;
        }
    }
    
    x -= hspeed;
    y -= vspeed;
}
