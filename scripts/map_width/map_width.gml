function map_width() {
	// returns the width in pixels of the current map
	// This is the scaled width, so on non-custom maps, it's equal to the width of the room

	{
	  if(room == CustomMapRoom || room == BuilderRoom) {
	    return __background_get( e__BG.Width, 7 ) * __background_get( e__BG.XScale, 7 );
	  } else {
	    return room_width;
	  }
	}



}
