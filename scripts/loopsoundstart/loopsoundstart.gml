function loopsoundstart(argument0, argument1, argument2) {
	{
	    sound_volume(argument2, calculateVolume(argument0, argument1));
	    sound_pan(argument2, calculatePan(argument0));
    
	    sound_loop(argument2);
	}



}
