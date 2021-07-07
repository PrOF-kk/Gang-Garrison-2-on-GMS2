function drawProgressBar(argument0, argument1) {
	//Draws a progress bar on the screen.
	//argument0: % done to display
	//argument1: message to display

	draw_healthbar(__view_get( e__VW.WPort, 0 )/2-200,__view_get( e__VW.HPort, 0 )/2-30,__view_get( e__VW.WPort, 0 )/2+200,__view_get( e__VW.HPort, 0 )/2+30,argument0,c_blue,c_green,c_green,0,true,true);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(__view_get( e__VW.WPort, 0 )/2,__view_get( e__VW.HPort, 0 )/2-10,string_hash_to_newline(argument1));
	draw_text(__view_get( e__VW.WPort, 0 )/2,__view_get( e__VW.HPort, 0 )/2+10,string_hash_to_newline(string(argument0)+"%"));




}
