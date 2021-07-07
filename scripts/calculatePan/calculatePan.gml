function calculatePan(argument0) {
	{
	    var xmid;
	    xmid = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
    
	    if((argument0-xmid)<-400) {
	        return -1;
	    } else if((argument0-xmid)>400) {
	        return 1;
	    } else {
	        return ((argument0-xmid)/400);
	    }
	}



}
