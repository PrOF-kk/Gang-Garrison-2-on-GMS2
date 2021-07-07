if (num_bgs == 0)
    exit;   // Nothing to do here

var i, xorigin, yorigin, xparallax, yparallax;
for (i = 0; i < num_bgs; i += 1)
{
    // origin of parallax happens to be the same as the screen shift
    xorigin = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2 - (__background_get( e__BG.Width, i )*__background_get( e__BG.XScale, i ))/2;
    yorigin = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2 - (__background_get( e__BG.Height, i )*__background_get( e__BG.YScale, i ))/2;
    
    // amount of parallax
    if (background_xfactor[i] != 0)
        xparallax = 1/power(background_xfactor[i], 2) * xorigin;
    else
        xparallax = 0;
        
    if (background_yfactor[i] != 0)
        yparallax = 1/power(background_yfactor[i], 2) * yorigin;
    else 
        yparallax = 0;
        
    __background_set( e__BG.X, i, xorigin - xparallax );
    __background_set( e__BG.Y, i, yorigin - yparallax );
}

