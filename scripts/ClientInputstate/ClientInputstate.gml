function ClientInputstate(argument0, argument1) {
	// Notify the server about the current keystate and aim direction
	// Argument 0: Buffer or socket to write to
	// Argument 1: the current keybyte

	write_ubyte(argument0, INPUTSTATE);
	write_ubyte(argument0, argument1);
	write_ushort(argument0, point_direction(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2, mouse_x, mouse_y)*65536/360);
	write_ubyte(argument0, min(255, point_distance(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2, mouse_x, mouse_y)/2));




}
