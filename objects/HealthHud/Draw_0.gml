xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

if(global.myself.team == TEAM_BLUE) {
    image_index = global.myself.class + 10;
} else {
    image_index = global.myself.class;
}

if(global.myself.object == -1) {
    instance_destroy();
    exit; 
}

drawHealth(45, ysize-53, global.myself.object.hp, global.myself.object.maxHp);
draw_sprite_ext(sprite_index, image_index, __view_get( e__VW.XView, 0 )+5, __view_get( e__VW.YView, 0 )+ysize-75, 2, 2, 0, c_white, 1);

