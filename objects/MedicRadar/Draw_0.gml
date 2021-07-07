if(global.medicRadar != 1) exit;

var xOffset,yOffset,width,height;

xOffset = __view_get( e__VW.XView, 0 );
yOffset = __view_get( e__VW.YView, 0 );
width = __view_get( e__VW.WView, 0 );
height = __view_get( e__VW.HView, 0 );

if(global.myself.team==TEAM_RED) {
    draw_set_color(c_red);
} else {
    draw_set_color(c_blue);
}

with(Character) {
    var bubbleImage, bubbleAlpha, theta, unknown, cornerDegree;
    bubbleImage = bubble.image_index;
    bubbleAlpha = bubble.image_alpha;
    cornerDegree = arcsin(.6);
    if(     player.team == global.myself.team &&
            bubble.visible &&
            (bubbleImage == 45 || bubbleImage == 49) &&
            (x > xOffset + width || x < xOffset || y > yOffset+height || y < yOffset)) {
        draw_set_alpha(bubbleAlpha);
        theta = point_direction(global.myself.object.x, global.myself.object.y, x, y)*pi/180;
        if(theta <= cornerDegree || theta > 2*pi - cornerDegree){
            unknown = (width/2 - 38*cos(theta))*tan(theta);
            draw_sprite_ext(MedRadarArrow, floor(hp/maxHp * 19), xOffset + width - cos(theta)*38, yOffset+ height/2 -unknown, 1,1,theta*180/pi, c_white, bubbleAlpha);
            if(mouse_x > xOffset + width - cos(theta)*38 -15 && mouse_y > yOffset+ height/2 -unknown -15&& mouse_y < yOffset+ height/2 -unknown + 15){
                draw_sprite_ext(MedAlert, (player.team * 10) + player.class + 2, xOffset + width - cos(theta)*38, yOffset+ height/2 -unknown, 1, 1, 0, c_white, bubbleAlpha);
                draw_set_halign(fa_right);
                if(theta< pi) {
                    draw_text(xOffset + width, yOffset+ height/2 -unknown + 20, string_hash_to_newline(sanitiseNewlines(player.name)));
                } else {
                    draw_text(xOffset + width, yOffset+ height/2 -unknown - 20, string_hash_to_newline(sanitiseNewlines(player.name)));
                }
            } else {
                draw_sprite_ext(MedAlert, bubbleImage == 49, xOffset + width - cos(theta)*38, yOffset+ height/2 -unknown, 1, 1, 0, c_white, bubbleAlpha);
            }
        } else if(theta > cornerDegree && theta <= pi - cornerDegree){
            unknown = (height/2 - 38*sin(theta))*(1/tan(theta));
            draw_sprite_ext(MedRadarArrow, floor(hp/maxHp * 19), xOffset + unknown+width/2, yOffset+38*sin(theta), 1,1,theta*180/pi, c_white, bubbleAlpha);
            if(mouse_x > xOffset + unknown+width/2 -15&& mouse_x < xOffset + unknown+width/2 + 15 && mouse_y < yOffset+38*sin(theta) + 15){
                draw_sprite_ext(MedAlert, (player.team * 10) + player.class + 2, xOffset + unknown+width/2, yOffset+38*sin(theta), 1,1,0, c_white, bubbleAlpha);
                draw_text(xOffset + unknown+width/2, yOffset+38*sin(theta) + 20, string_hash_to_newline(sanitiseNewlines(player.name)));
            } else {
                draw_sprite_ext(MedAlert, bubbleImage == 49, xOffset + unknown+width/2, yOffset+38*sin(theta), 1,1,0, c_white, bubbleAlpha);
            }
        } else if(theta > pi - cornerDegree && theta <= pi + cornerDegree){
            unknown = (width/2 +38*cos(theta))*tan(theta);
            draw_sprite_ext(MedRadarArrow, floor(hp/maxHp * 19), xOffset -38*cos(theta), yOffset + unknown +height/2, 1,1,theta*180/pi, c_white, bubbleAlpha);
            if(mouse_x < xOffset - 38*cos(theta) +15 && mouse_y > yOffset + unknown +height/2 -15 && mouse_y < yOffset + unknown +height/2 + 15){
                draw_sprite_ext(MedAlert, (player.team * 10) + player.class + 2, xOffset - 38*cos(theta), yOffset + unknown +height/2, 1,1,0, c_white, bubbleAlpha);
                draw_set_halign(fa_left);
                if(theta < pi) {
                    draw_text(xOffset, yOffset + unknown +height/2 +20, string_hash_to_newline(sanitiseNewlines(player.name)));
                } else {
                    draw_text(xOffset, yOffset + unknown +height/2 -20, string_hash_to_newline(sanitiseNewlines(player.name)));
                }
            } else {
                draw_sprite_ext(MedAlert, bubbleImage == 49, xOffset - 38*cos(theta), yOffset + unknown +height/2, 1,1,0, c_white, bubbleAlpha);
            }
        } else {
            unknown = (height/2+ 38*sin(theta))*(1/tan(theta));
            draw_sprite_ext(MedRadarArrow, floor(hp/maxHp * 19), xOffset +width/2 - unknown, yOffset + height+38*sin(theta), 1,1,theta*180/pi, c_white, bubbleAlpha);
            if(mouse_x > xOffset +width/2 - unknown - 13 && mouse_x < xOffset +width/2 - unknown + 13 && mouse_y > yOffset + height+38*sin(theta) - 13){
                draw_sprite_ext(MedAlert, (player.team * 10) + player.class + 2, xOffset +width/2 - unknown, yOffset + height+38*sin(theta), 1,1,0, c_white, bubbleAlpha);
                draw_text(xOffset +width/2 - unknown, yOffset + height+38*sin(theta) - 20, string_hash_to_newline(sanitiseNewlines(player.name)));
            } else {
                draw_sprite_ext(MedAlert, bubbleImage == 49, xOffset +width/2 - unknown, yOffset + height+38*sin(theta), 1,1,0, c_white, bubbleAlpha);
            }
        }
    }
}

draw_set_alpha(1);

