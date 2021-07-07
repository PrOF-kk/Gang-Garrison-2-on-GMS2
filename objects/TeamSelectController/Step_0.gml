if(not done) {
    if(alpha<0.99) alpha = power(alpha,power(0.7, global.delta_factor));
    else alpha = 0.99;
    if y<120 y+=15 * global.delta_factor;
    if y>120 y=120;
}
else
{
    if(alpha>0.01) alpha = power(alpha,power(1/0.7, global.delta_factor));
    y-=15 * global.delta_factor;
    if y < -120 instance_destroy();
}

balance = calculateTeamBalance();
    
xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );

    
if(mouse_x>xoffset+40 && mouse_x <xoffset+127 && mouse_y>yoffset+48 && mouse_y<yoffset+223)
{
    newteam=TEAM_ANY;
    drawx=40;
    door=2;

    text[0]="Auto Select";
    text[1]="";
    text[2]="Let us place you on the team";
    text[3]="that needs you the most!";
    text[4]="";
}
else if(mouse_x>xoffset+156 && mouse_x <xoffset+193 && mouse_y>yoffset+118 && mouse_y<yoffset+151)
{
    newteam=TEAM_SPECTATOR;
    drawx=156;
    door=-1;

    text[0]="Spectate";
    text[1]="";
    text[2]="Get a glimpse of the action";
    text[3]="from a safe distance!";
    text[4]="";
}
else if(mouse_x>xoffset+228 && mouse_x <xoffset+315 && mouse_y>yoffset+48 && mouse_y<yoffset+223)
{
    newteam=TEAM_RED;
    drawx=228;
    if(balance == TEAM_RED)
        door=3;
    else
        door=0;

    text[0]="RED";
    text[1]="Respectable Elucidation Division";
    text[2]="A private company dedicated to";
    text[3]="illicit information acquisition";
    text[4]="and other shady activities.";
}
else if(mouse_x>xoffset+340 && mouse_x <xoffset+427 && mouse_y>yoffset+48 && mouse_y<yoffset+223)
{
    newteam=TEAM_BLUE;
    drawx=340;
    if(balance == TEAM_BLUE)
        door=4;
    else
        door=1;

    text[0]="BLU";
    text[1]="Bolstered Locks Unlimited";
    text[2]="The leading name in freelance";
    text[3]="security and use of brute force";
    text[4]="in property protection.";
}
else
{
    newteam=-1;
    door=-1;
}

var teamFull;
teamFull = (newteam==TEAM_RED or newteam==TEAM_RED) and balance == newteam;

if(mouse_check_button(mb_left) and not teamFull)
{
    team = newteam;
    event_user(1);
}

if(afk)
{
    team = TEAM_SPECTATOR;
    event_user(1);
}

