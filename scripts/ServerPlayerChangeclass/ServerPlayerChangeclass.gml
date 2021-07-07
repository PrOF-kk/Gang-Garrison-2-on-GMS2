function ServerPlayerChangeclass(argument0, argument1, argument2) {
	write_ubyte(argument2, PLAYER_CHANGECLASS);
	write_ubyte(argument2, argument0);
	write_ubyte(argument2, argument1);



}
