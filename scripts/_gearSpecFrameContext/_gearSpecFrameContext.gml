function _gearSpecFrameContext(argument0, argument1, argument2, argument3) {
	// _gearSpecFrameContext(classConstant, teamConstant, animationName, subimage)
	var classConstant, teamConstant, animationName, subimage;

	classConstant = argument0;
	teamConstant = argument1;
	animationName = argument2;
	subimage = argument3;

	return _gearSpecClassTeamContext(classConstant, teamConstant) + " " + animationName + " " + string(subimage);



}
