function initCrown() {
	var gearSpec;
	gearSpec = gearSpecCreate();
	gearSpecDefaultOverlay(gearSpec, CrownS, CrownS, 0);
	gearSpecClassOverlay(gearSpec, CLASS_PYRO, CrownSmallS, CrownSmallS, 0);
	gearSpecClassOverlay(gearSpec, CLASS_DEMOMAN, CrownSmallS, CrownSmallS, 0);
	gearSpecClassOverlay(gearSpec, CLASS_MEDIC, CrownSmallS, CrownSmallS, 0);
	gearSpecClassOverlay(gearSpec, CLASS_SNIPER, CrownSmallS, CrownSmallS, 0);
	gearSpecClassOverlay(gearSpec, CLASS_QUOTE, CrownQuerlyS, CrownQuerlyS, 0);
	gearSpecFrameOverlay(gearSpec, CLASS_PYRO, "Taunt", 2, CrownBehindPyroTauntS, CrownBehindPyroTauntS, 0);
	gearSpecFrameOverlay(gearSpec, CLASS_PYRO, "Taunt", 7, CrownBehindPyroTauntS, CrownBehindPyroTauntS, 0);
	gearSpecClassOverlayOffset(gearSpec, CLASS_SOLDIER, 0, 2);
	gearSpecClassOverlayOffset(gearSpec, CLASS_DEMOMAN, 0, 2);
	gearSpecClassOverlayOffset(gearSpec, CLASS_MEDIC, 0, 2);
	gearSpecClassOverlayOffset(gearSpec, CLASS_SPY, 0, 2);
	gearSpecClassOverlayOffset(gearSpec, CLASS_SNIPER, 0, 0);
	gearSpecApply(gearSpec, GEAR_CROWN);
	gearSpecDestroy(gearSpec);



}
