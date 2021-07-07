//Ensure we don't scroll past the edges of the level
if(__view_get( e__VW.YView, 0 ) > 6 * background_get_height(BuilderBGB) - __view_get( e__VW.HView, 0 )) __view_set( e__VW.YView, 0, 6 * background_get_height(BuilderBGB) - __view_get( e__VW.HView, 0 ) );
if(__view_get( e__VW.XView, 0 ) > 6 * background_get_width(BuilderBGB) - __view_get( e__VW.WView, 0 )) __view_set( e__VW.XView, 0, 6 * background_get_width(BuilderBGB) - __view_get( e__VW.WView, 0 ) );
if(__view_get( e__VW.YView, 0 ) < 0) __view_set( e__VW.YView, 0, 0 );
if(__view_get( e__VW.XView, 0 ) < 0) __view_set( e__VW.XView, 0, 0 );

