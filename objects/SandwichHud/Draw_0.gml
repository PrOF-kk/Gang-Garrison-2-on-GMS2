var xoffset, yoffset, xsize, ysize;    
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );
if (global.myself.team == TEAM_BLUE)
    offset = 1;
else
    offset = 0;

if (global.myself.object == -1 or global.myself.class != CLASS_HEAVY)
{
    instance_destroy();
    exit;
}
draw_set_valign(fa_center);
draw_set_halign(fa_right);
draw_set_alpha(1);
barcolor = make_color_rgb(217,217,183);
var sandwichScalar;
if !(global.myself.object.canEat)
    sandwichScalar = (1-(global.myself.object.alarm[6]/(global.myself.object.eatCooldown / global.delta_factor))) * 100
else
    sandwichScalar = 100
draw_sprite_ext(sprite_index,offset,xoffset+xsize-70,yoffset+ysize-85,2,2,0,c_white,1);
draw_healthbar(xoffset+xsize-85,yoffset+ysize-72,xoffset+xsize-50,yoffset+ysize-67,sandwichScalar,c_black,barcolor,barcolor,0,true,false);

