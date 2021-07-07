xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

drawControlPointStatus(0);

xshift = -320*global.timerPos;
yshift = 5*global.timerPos;

draw_roundtimer(xoffset, yoffset, xsize, ysize, timer);

