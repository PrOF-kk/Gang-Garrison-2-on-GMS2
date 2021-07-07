alpha=0;
fade=0.05;

if(instance_exists(ArenaControlPoint)) {
    mode=2;     // Arena
    locked=true;
} else if(instance_exists(KothControlPoint)) {
    mode=3;     // King of the Hill
    locked=true;
} else if(instance_exists(KothRedControlPoint) && instance_exists(KothBlueControlPoint)) {
    mode=4;     // Dual King of the Hill
    locked=true;
}else if(instance_exists(ControlPointSetupGate)) {
    mode=1;     // A/D
    locked=false;
} else {
    mode=0;     // Symmetrical CP
    locked=false;
}
    
global.cp[cp] = id;

team=-1;
redPresence=0;
bluePresence=0;
capping=0;
cappers=0;
cappingTeam=-1;
capTime=300;

