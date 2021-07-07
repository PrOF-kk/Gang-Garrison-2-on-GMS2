function gearSpecDefaultSubimageScript(argument0, argument1) {
	// Sets a script which will be used in all animation frames to select the subimage of the sprite

	_gearSpecSet(argument0, _gearSpecDefaultTeamContext(TEAM_RED), "subimageScript", argument1);
	_gearSpecSet(argument0, _gearSpecDefaultTeamContext(TEAM_BLUE), "subimageScript", argument1);



}
