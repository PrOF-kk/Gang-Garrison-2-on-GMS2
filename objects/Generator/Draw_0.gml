xviewoffset = __view_get( e__VW.XView, 0 );
yviewoffset = __view_get( e__VW.YView, 0 );
xviewsize = __view_get( e__VW.WView, 0 );
yviewsize = __view_get( e__VW.HView, 0 );
    
if distance_to_point(xviewoffset+xviewsize/2,yviewoffset+yviewsize/2) > 800 exit;

draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1);
draw_sprite_ext(GeneratorShieldS,floor(shieldIndex),x,y,1,1,0,c_white, (shieldHp > 0)*0.25 + 0.5*shieldHp/maxShieldHp);

