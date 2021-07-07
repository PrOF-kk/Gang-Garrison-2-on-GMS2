timeLimit=global.timeLimitMins*30*60;
timer=timeLimit;
overtime = 0;
global.totalControlPoints = instance_number(ControlPoint);

if instance_exists(ControlPointSetupGate)
{
    global.setupTimer=900;
    mode=1;
    // 3 minutes
    timeLimit = 3*30*60;
    basetime=6*30;
    //basetime=10;
    if global.totalControlPoints == 5 {
        ControlPoint5.capTime = basetime;
        ControlPoint4.capTime = basetime*2;
        ControlPoint3.capTime = basetime*3;
        ControlPoint2.capTime = basetime*4;
        ControlPoint1.capTime = basetime*5;
    }
    else if global.totalControlPoints == 4{
        ControlPoint4.capTime = basetime*1.5;
        ControlPoint3.capTime = basetime*3;
        ControlPoint2.capTime = basetime*4.5;
        ControlPoint1.capTime = basetime*6;
    }
    else if global.totalControlPoints == 3{
        ControlPoint3.capTime = basetime*2.5;
        ControlPoint2.capTime = basetime*5;
        ControlPoint1.capTime = basetime*7.5;
    }
    else if global.totalControlPoints == 2{
        ControlPoint2.capTime = basetime*2.5/*5*/;
        ControlPoint1.capTime = basetime*10;
    }
    else if global.totalControlPoints == 1{
        ControlPoint1.capTime = basetime*15;
    }
}
else
{
    global.setupTimer=0;
    mode=0;
    basetime=7*30;
    //basetime=20;
    if global.totalControlPoints == 5 {
        ControlPoint5.capTime = basetime;
        ControlPoint4.capTime = basetime*2;
        ControlPoint3.capTime = basetime*3;
        ControlPoint2.capTime = basetime*2;
        ControlPoint1.capTime = basetime;
    }
    else if global.totalControlPoints == 4 {
        ControlPoint4.capTime = basetime*1.5;
        ControlPoint3.capTime = basetime*3;
        ControlPoint2.capTime = basetime*3;
        ControlPoint1.capTime = basetime*1.5;
    }
    else if global.totalControlPoints == 3 {
        ControlPoint3.capTime = basetime*2.25;
        ControlPoint2.capTime = basetime*4.5;
        ControlPoint1.capTime = basetime*2.25;
    }
    else if global.totalControlPoints == 2 {
        ControlPoint2.capTime = basetime*4.5;
        ControlPoint1.capTime = basetime*4.5;
    }
    else if global.totalControlPoints == 1 {
        ControlPoint1.capTime = basetime*9;
    }
}

if (mode==0)
{
    var middlePoint;
    middlePoint = (global.totalControlPoints+1)/2;
    
    for (i=1; i<= global.totalControlPoints; i+=1)
    {
        if (i < middlePoint)
            global.cp[i].team = TEAM_RED;
        else if (i > middlePoint)
            global.cp[i].team = TEAM_BLUE;
        else // middle point, if exists
            global.cp[i].team = -1;
    }
}
else if (mode==1)
{
    for (i=1; i <= global.totalControlPoints; i+=1)
        global.cp[i].team=TEAM_BLUE;
}

/* */
/*  */
