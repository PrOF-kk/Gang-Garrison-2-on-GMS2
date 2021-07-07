function _gearSpecClassTeamContext(argument0, argument1) {
	// _gearSpecClassTeamContext(classConstant, teamConstant)
	var classConstant, teamConstant;

	classConstant = argument0;
	teamConstant = argument1;

	return global.characterSpriteTeamPrefixes[teamConstant] + " " + global.characterSpriteClassPrefixes[classConstant];



}
