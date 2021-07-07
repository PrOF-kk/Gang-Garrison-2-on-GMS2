xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

global.totalControlPoints = 1;
global.cp[0] = KothControlPoint.id;
drawControlPointStatus(cpUnlock);

if (global.kothHudPos)
{
    coffset = 0;
    xshift = -323*global.timerPos;
    yshift = 35;
}
else
{
    coffset = 43*1.15;
    xshift = -290*global.timerPos;
    yshift = 0;
}

draw_kothtimer();


