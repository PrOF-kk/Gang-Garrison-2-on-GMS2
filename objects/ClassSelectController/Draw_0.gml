var xoffset, yoffset, xsize, ysize;
if(instance_exists(DeathCam)) exit;
if(!(global.myself.team==TEAM_RED || global.myself.team==TEAM_BLUE)) {
    instance_destroy();
    exit;
}

xoffset = __view_get( e__VW.XView, 0 );
yoffset = __view_get( e__VW.YView, 0 );
xsize = __view_get( e__VW.WView, 0 );
ysize = __view_get( e__VW.HView, 0 );

if alpha < 0.8 draw_set_alpha(alpha);
else draw_set_alpha(0.8);
draw_rectangle_color(xoffset,yoffset,xoffset+xsize,yoffset+ysize,c_black,c_black,c_black,c_black,0);
    
draw_sprite_ext(ClassSelectBS, 0, xoffset+800, yoffset+y, max(0, xsize-800), 1, 0, c_white, alpha);
draw_sprite_ext(sprite_index, 0, xoffset+400, yoffset+y, 1, 1, 0, c_white, alpha);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
    
if newclass != -1 && y==120 {
    if(global.myself.team==TEAM_RED) {
        indexoffset=0;
    } else if(global.myself.team==TEAM_BLUE) {
        indexoffset=10;
    } else {
        exit;
    }
    draw_sprite_ext(ClassSelectSpritesS,newclass+indexoffset,xoffset+drawx[newclass],yoffset,1,1,0,c_white, alpha);

    draw_text(xoffset+495,yoffset+80,string_hash_to_newline(text[0]));
    draw_text(xoffset+495,yoffset+100,string_hash_to_newline(text[1]));
    draw_text(xoffset+495,yoffset+120,string_hash_to_newline(text[2]));
    draw_text(xoffset+495,yoffset+130,string_hash_to_newline(text[3]));
    draw_text(xoffset+495,yoffset+140,string_hash_to_newline(text[4]));
}

var classConstant, number, classCounter;
for (a=0; a<10; a+=1) classCounter[a] = 0

with Player
{
    if team == global.myself.team
    {
        classCounter[class] += 1
    }
}
    
for(i=0; i<9; i+=1)
{
    if i==0 classConstant = CLASS_SCOUT;
    else if i==1 classConstant = CLASS_PYRO;
    else if i==2 classConstant = CLASS_SOLDIER;
    else if i==3 classConstant = CLASS_HEAVY;
    else if i==4 classConstant = CLASS_DEMOMAN;
    else if i==5 classConstant = CLASS_MEDIC;
    else if i==6 classConstant = CLASS_ENGINEER;
    else if i==7 classConstant = CLASS_SPY;
    else if i==8 classConstant = CLASS_SNIPER;
    
    number = classCounter[classConstant]

    if global.classlimits[classConstant] < 255// Not disabled
    {
        if number < global.classlimits[classConstant]
        {
            draw_set_color(c_white);
        }
        else
        {
            draw_set_color(c_red);
        }
        draw_text(xoffset+drawx[i]+3, yoffset+43+(y-120), string_hash_to_newline(string(number)+"/"+string(global.classlimits[classConstant])));
    }
    else if number != 0
    {
        draw_set_color(c_white);
        draw_text(xoffset+drawx[i]+3, yoffset+43+(y-120), string_hash_to_newline(string(number)));
    }
}

