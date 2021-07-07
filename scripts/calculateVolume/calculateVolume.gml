function calculateVolume(argument0, argument1) {
	{
	    var xmid, ymid, dist;
	    xmid = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
	    ymid = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;
    
	    dist = sqrt(sqr(xmid-argument0) + sqr(ymid-argument1));
    
	    if(dist<300) {
	        return 1;
	    } else if(dist>1500) {
	        return 0;
	    } else {
	        return ((1500-dist)/1200);
	    }
	}



}
