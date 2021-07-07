function map_height() {
	// returns the width in pixels of the current map
	// This is the scaled width, so on non-custom maps, it's equal to the width of the room

	{
	  if(room == CustomMapRoom || room == BuilderRoom) {
	    return __background_get( e__BG.Height, 7 ) * __background_get( e__BG.YScale, 7 );
	  } else {
	    return room_height;
	  }
	}



}
