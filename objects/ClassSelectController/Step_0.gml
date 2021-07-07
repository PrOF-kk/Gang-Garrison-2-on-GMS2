if(not done) {
    if(alpha<0.99) alpha = power(alpha,power(0.7, global.delta_factor));
    else alpha = 0.99;
    if y<120 y+=15 * global.delta_factor;
    if y>120 y=120;
}
else {
    if(alpha>0.01) alpha = power(alpha,power(1/0.7, global.delta_factor));
    y-=15 * global.delta_factor;
    if y < -120 instance_destroy();
}

xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );

if mouse_x>xoffset+24 && mouse_x <xoffset+60 && mouse_y<yoffset+50{
    newclass=0;
    text[0]="Runner";
    text[1]="Weapon: Scattergun";
    text[2]="Quick as the wind, the Runner";
    text[3]="excels in recovering objectives.";
    text[4]="He can double jump in mid-air.";
}

else if mouse_x>xoffset+64 && mouse_x <xoffset+100 && mouse_y<yoffset+50{
    newclass=1;
    text[0]="Firebug";
    text[1]="Weapon: Flamethrower";
    text[2]="Gets close to burn his foes.";
    text[3]="Pushes enemies and projectiles";
    text[4]="away with a burst of air.";
}

else if mouse_x>xoffset+104 && mouse_x <xoffset+140 && mouse_y<yoffset+50{
    newclass=2;
    text[0]="Rocketman";
    text[1]="Weapon: Rocket Launcher";
    text[2]="Strong yet graceful, he can";
    text[3]="launch himself skyward with his";
    text[4]="rockets as well as do damage.";
}

else if mouse_x>xoffset+156 && mouse_x <xoffset+192 && mouse_y<yoffset+50{
    newclass=3;
    text[0]="Overweight";
    text[1]="Weapon: Minigun";
    text[2]="A mammoth of a man, carrying";
    text[3]="a heavy weapon that will shred";
    text[4]="enemies. He can sure eat, too!";
}

else if mouse_x>xoffset+196 && mouse_x <xoffset+232 && mouse_y<yoffset+50{
    newclass=4;
    text[0]="Detonator";
    text[1]="Weapon: Mine Launcher";
    text[2]="A master of explosives, the";
    text[3]="Detonator can stick mines to";
    text[4]="any surface and set them off.";
}

else if mouse_x>xoffset+236 && mouse_x <xoffset+272 && mouse_y<yoffset+50{
    newclass=5;
    text[0]="Healer";
    text[1]="Weapon: Needlegun";
    text[2]="His all-purpose healing gun can";
    text[3]="both heal his team from afar";
    text[4]="and rain syringes on foes.";
}

else if mouse_x>xoffset+288 && mouse_x <xoffset+324 && mouse_y<yoffset+50{
    newclass=6;
    text[0]="Constructor";
    text[1]="Weapon: Shotgun";
    text[2]="A brilliant inventor, the";
    text[3]="Constructor can build sentry";
    text[4]="guns that protect whole areas.";
}

else if mouse_x>xoffset+328 && mouse_x <xoffset+364 && mouse_y<yoffset+50{
    newclass=7;
    text[0]="Infiltrator";
    text[1]="Weapon: Revolver";
    text[2]="Can become invisible to slip";
    text[3]="behind enemy lines and deliver";
    text[4]="a fatal strike with his knife.";
}

else if mouse_x>xoffset+368 && mouse_x <xoffset+404 && mouse_y<yoffset+50{
    newclass=8;
    text[0]="Rifleman";
    text[1]="Weapon: Sniper Rifle";
    text[2]="Armed with his trusty rifle";
    text[3]="and dead aim, his zoom scope";
    text[4]="allows him to attack from afar.";
}

else if mouse_x>xoffset+420 && mouse_x <xoffset+456 && mouse_y<yoffset+50{
    newclass=9;
    text[0]="Random Select";
    text[1]="";
    text[2]="Can't decide? Let us choose";
    text[3]="a class for you to play.";
    text[4]="";
}

else newclass=-1;

if newclass != mousedclass && newclass !=-1 && y=120{
    if instance_exists(CharacterPortraitAnimation){
        with(CharacterPortraitAnimation){
            instance_destroy()
        }
    }
    if(newclass>=0 and newclass<=9) {
        instance_create(xoffset+230, yoffset+128, portraitAnimations[newclass]);
    }
    
        mousedclass=newclass; //set the 'moused class' (current moused class) to that of newclass
}       

if mouse_check_button(mb_left) && newclass !=-1{
    if newclass==0 class = CLASS_SCOUT;
    else if newclass==1 class = CLASS_PYRO;
    else if newclass==2 class = CLASS_SOLDIER;
    else if newclass==3 class = CLASS_HEAVY;
    else if newclass==4 class = CLASS_DEMOMAN;
    else if newclass==5 class = CLASS_MEDIC;
    else if newclass==6 class = CLASS_ENGINEER;
    else if newclass==7 class = CLASS_SPY;
    else if newclass==8 class = CLASS_SNIPER;
    else class=random(9);
    event_user(1);
}


