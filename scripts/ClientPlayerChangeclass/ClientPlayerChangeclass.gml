function ClientPlayerChangeclass(argument0, argument1) {
	// Write a message to the buffer-ish argument1 that informs the server
	// that we want to switch to class argument0.

	write_ubyte(argument1, PLAYER_CHANGECLASS);
	write_ubyte(argument1, argument0);



}
