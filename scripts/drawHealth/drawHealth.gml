function drawHealth(argument0, argument1, argument2, argument3) {
	/**
	 * Draws a healthbar for HealthHud and SentryHealthHud
	 * Arguments: drawHealth(x,y,hp,maxHp)
	 * x/y-Position is the top left of the drawn health bar
	 */
	var xoffset, yoffset, xsize, ysize, xpos, ypos, hp, maxHp;
	xoffset = __view_get( e__VW.XView, 0 );
	yoffset = __view_get( e__VW.YView, 0 );
	xsize = __view_get( e__VW.WView, 0 );
	ysize = __view_get( e__VW.HView, 0 );

	xpos = argument0;
	ypos = argument1;
	hp = argument2;
	maxHp = argument3;

	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_alpha(1);
	draw_healthbar(xoffset+xpos, yoffset+ypos, xoffset+xpos+42, yoffset+ypos+37, hp*100/maxHp, c_black, c_red, c_green, 3, true, false);

	var hpText,hpColor;
	if(hp > (maxHp/3.5))
	    hpColor = c_white;
	else
	    hpColor = c_red;

	hpText = string(ceil(min(max(hp,0),maxHp)));

	draw_text_color(xoffset+xpos+24, yoffset+ypos+18, string_hash_to_newline(hpText), hpColor, hpColor, hpColor, hpColor, 1);



}
