xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );
xshift = -320*global.timerPos;
yshift = 5*global.timerPos;

barcolor=make_color_rgb(217,217,183);
draw_set_alpha(1);

draw_sprite_ext(GeneratorHUDS,0,xoffset+xsize/2,yoffset+ysize-50,2,2,0,c_white,1);
if instance_exists(GeneratorRed) {
    draw_sprite_ext(GeneratorRedS,GeneratorRed.image_index,xoffset+xsize/2-50,yoffset+ysize-50,1,1,0,c_white,1);
    draw_sprite_ext(GeneratorShieldS,floor(GeneratorRed.shieldIndex),xoffset+xsize/2-50,yoffset+ysize-50,1,1,0,c_white, GeneratorRed.shieldResistance);
    draw_healthbar(xoffset+xsize/2-77, yoffset+ysize-75, xoffset+xsize/2-25, yoffset+ysize-68,GeneratorRed.hp*100/GeneratorRed.maxHp,c_black,barcolor,barcolor,0,true,true);
    draw_healthbar(xoffset+xsize/2-77, yoffset+ysize-30, xoffset+xsize/2-25, yoffset+ysize-23,GeneratorRed.shieldHp*100/GeneratorRed.maxShieldHp,c_black,barcolor,barcolor,0,true,true);
}
if instance_exists(GeneratorBlue) {
    draw_sprite_ext(GeneratorBlueS,GeneratorBlue.image_index,xoffset+xsize/2+50,yoffset+ysize-50,1,1,0,c_white,1);
    draw_sprite_ext(GeneratorShieldS,floor(GeneratorBlue.shieldIndex),xoffset+xsize/2+50,yoffset+ysize-50,1,1,0,c_white, GeneratorBlue.shieldResistance);
    draw_healthbar(xoffset+xsize/2+23, yoffset+ysize-75, xoffset+xsize/2+75, yoffset+ysize-68,GeneratorBlue.hp*100/GeneratorBlue.maxHp,c_black,barcolor,barcolor,0,true,true);
    draw_healthbar(xoffset+xsize/2+23, yoffset+ysize-30, xoffset+xsize/2+75, yoffset+ysize-23,GeneratorBlue.shieldHp*100/GeneratorBlue.maxShieldHp,c_black,barcolor,barcolor,0,true,true);
}

draw_roundtimer(xoffset, yoffset, xsize, ysize, timer);

