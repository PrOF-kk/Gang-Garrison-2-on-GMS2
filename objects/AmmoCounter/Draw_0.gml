var xoffset, yoffset, xsize, ysize;
xoffset = __view_get( e__VW.XView, 0 )-800+__view_get( e__VW.WView, 0 ); // i'm not going to fix this the proper way for EVERY SINGLE WEAPON HHNGNGH GOD
yoffset = __view_get( e__VW.YView, 0 )-600+__view_get( e__VW.HView, 0 );
xsize = 800;
ysize = 600;
draw_set_alpha(1);

if global.myself.object != -1 {
    if instance_exists(global.myself.object.currentWeapon) {
        var weapon;
        weapon = global.myself.object.currentWeapon;
        barcolor = make_color_rgb(217,217,183);
        draw_set_color(barcolor);
    
        //set team offset here - but rocketmans is different because
        //of the little rockets that are drawn
        if global.myself.team == TEAM_BLUE toffset = 1;
        else toffset = 0;
        
        if global.myself.class==CLASS_SOLDIER {
            if global.myself.team == TEAM_BLUE toffset = 5;
            else toffset = 0;
            reloadscalar = 100-global.myself.object.currentWeapon.alarm[5]*global.delta_factor/global.myself.object.currentWeapon.reloadTime*100;
            draw_sprite_ext(Rocketclip,global.myself.object.currentWeapon.ammoCount+toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            draw_healthbar(xoffset+689,yoffset+ysize/1.26+90,xoffset+723,yoffset+ysize/1.26+98,reloadscalar,c_black,barcolor,barcolor,0,true,false);
        }
        else if global.myself.class==CLASS_DEMOMAN{        
            reloadscalar = 100-global.myself.object.currentWeapon.alarm[5]*global.delta_factor/global.myself.object.currentWeapon.reloadTime*100;
            draw_sprite_ext(MinegunAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            draw_text(xoffset+765,yoffset+ysize/1.26+95,string_hash_to_newline(global.myself.object.currentWeapon.ammoCount));
            draw_healthbar(xoffset+700,yoffset+ysize/1.26+90,xoffset+750,yoffset+ysize/1.26+98,reloadscalar,c_black,barcolor,barcolor,0,true,false);
        }
        else if global.myself.class==CLASS_SCOUT {
            reloadscalar = 100-global.myself.object.currentWeapon.alarm[5]*global.delta_factor/global.myself.object.currentWeapon.reloadTime*100;
            draw_sprite_ext(ScattergunAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            draw_text(xoffset+765,yoffset+ysize/1.26+95,string_hash_to_newline(global.myself.object.currentWeapon.ammoCount));
            draw_healthbar(xoffset+700,yoffset+ysize/1.26+90,xoffset+750,yoffset+ysize/1.26+98,reloadscalar,c_black,barcolor,barcolor,0,true,false);
        }
        else if global.myself.class==CLASS_ENGINEER {
            reloadscalar = 100-global.myself.object.currentWeapon.alarm[5]*global.delta_factor/global.myself.object.currentWeapon.reloadTime*100;
            draw_sprite_ext(ShotgunAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            draw_text(xoffset+765,yoffset+ysize/1.26+95,string_hash_to_newline(global.myself.object.currentWeapon.ammoCount));
            draw_healthbar(xoffset+700,yoffset+ysize/1.26+90,xoffset+750,yoffset+ysize/1.26+98,reloadscalar,c_black,barcolor,barcolor,0,true,false);
        }
        else if global.myself.class == CLASS_SPY {
            reloadscalar = 100-global.myself.object.currentWeapon.alarm[5]*global.delta_factor/global.myself.object.currentWeapon.reloadTime*100;
            draw_sprite_ext(RevolverAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            draw_text(xoffset+765,yoffset+ysize/1.26+95,string_hash_to_newline(global.myself.object.currentWeapon.ammoCount));
            draw_healthbar(xoffset+700,yoffset+ysize/1.26+90,xoffset+750,yoffset+ysize/1.26+98,reloadscalar,c_black,barcolor,barcolor,0,true,false);
        }
        else if global.myself.class == CLASS_MEDIC {
            reloadscalar = 100-global.myself.object.currentWeapon.alarm[5]*global.delta_factor/global.myself.object.currentWeapon.reloadTime*100;
            draw_sprite_ext(NeedleAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            draw_text(xoffset+765,yoffset+ysize/1.26+95,string_hash_to_newline(global.myself.object.currentWeapon.ammoCount));
            draw_healthbar(xoffset+700,yoffset+ysize/1.26+90,xoffset+750,yoffset+ysize/1.26+98,reloadscalar,c_black,barcolor,barcolor,0,true,false);
        }
        else if global.myself.class == CLASS_PYRO {    
            draw_sprite_ext(GasAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            if (global.myself.object.currentWeapon.ammoCount <= 1/4 * global.myself.object.currentWeapon.maxAmmo) { barcolor = make_color_rgb(255,0,0); }
            draw_healthbar(xoffset+689,yoffset+ysize/1.26+90,xoffset+723,yoffset+ysize/1.26+98,global.myself.object.currentWeapon.ammoCount/2,c_black,barcolor,barcolor,0,true,false);
            offset = 0;
            with(global.myself.object.currentWeapon)
            {
                var offset, flarecolor;
                
                if(readyToFlare)
                    flarecolor = c_white;
                else
                    flarecolor = c_gray;
                offset = 0;
                    
                for (i = 1; i <= ammoCount/75; i += 1)
                {
                    draw_sprite_ext(FlareS,other.toffset,
                                    xoffset+760+offset,yoffset+ysize/1.26+93,
                                    1,1,0,flarecolor,100);
                    offset -= 20;
                }
            }
        }
        else if global.myself.class == CLASS_HEAVY {       
            draw_sprite_ext(MinigunAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            barcolor = merge_color(barcolor, make_color_rgb(255,0,0), 1-(weapon.ammoCount/weapon.maxAmmo));
            barcolor = merge_color(barcolor, make_color_rgb(50,50,50), max(0,weapon.alarm[5]*global.delta_factor)/25);
            draw_healthbar(xoffset+689,yoffset+ysize/1.26+90,xoffset+723,yoffset+ysize/1.26+98,
                           weapon.ammoCount/weapon.maxAmmo*100,c_black,barcolor,barcolor,0,true,false);
        }
        else if global.myself.class == CLASS_QUOTE {       
            draw_sprite_ext(BladeAmmoS,toffset,xoffset+728,yoffset+ysize/1.26+86,2.4,2.4,0,c_white,100);
            draw_healthbar(xoffset+689,yoffset+ysize/1.26+90,xoffset+723,yoffset+ysize/1.26+98,global.myself.object.currentWeapon.ammoCount/global.myself.object.currentWeapon.maxAmmo*100,c_black,barcolor,barcolor,0,true,false);
        }
    }
}

