if(owner.taunting)
    exit;
    
var imageOffset, xdrawpos, ydrawpos;
imageOffset = owner.team;
xdrawpos = round(x+xoffset*image_xscale);
ydrawpos = round(y+yoffset);
if(instance_exists(healTarget))
{
    if(healTarget.object != -1)
    {
        var color;
        if(healTarget.team == TEAM_RED)
            color = c_red;
        else
            color = c_blue;
            
        draw_set_alpha(0.3);
        draw_line_width_color(xdrawpos+lengthdir_x(24,owner.aimDirection),ydrawpos+lengthdir_y(24,owner.aimDirection),healTarget.object.x, healTarget.object.y, 5, color, color);

        sprite_index = normalSprite;
        imageOffset = owner.team+2;
    }
} else {
    var recoilAlarmStart, reloadAlarmStart;
    recoilAlarmStart = round(recoilTime / global.delta_factor);
    reloadAlarmStart = round(reloadTime / global.delta_factor);
            
    if(alarm[6] > 0) {
        // We are shooting, loop the shoot animation
        sprite_index = recoilSprite;
        imageOffset = floor(recoilAnimLength*(recoilAlarmStart-alarm[6])/recoilAlarmStart) + owner.team*recoilAnimLength;
    } else if (alarm[5] > 0 && alarm[5] <= reloadAlarmStart) {
        sprite_index = reloadSprite;
        imageOffset = floor(reloadAnimLength*(reloadAlarmStart-alarm[5])/reloadAlarmStart) + owner.team*reloadAnimLength;;
    } else {
        // set the sprite to idle
        sprite_index = normalSprite;
        imageOffset = owner.team;
    }
}


if !owner.player.humiliated draw_sprite_ext(sprite_index,imageOffset, xdrawpos, ydrawpos, image_xscale, image_yscale, image_angle, c_white, 1);
if (owner.ubered) {
    if owner.team == TEAM_RED
        ubercolour = c_red;
    else if owner.team == TEAM_BLUE
        ubercolour = c_blue;
    draw_sprite_ext(sprite_index,imageOffset,round(x+xoffset*image_xscale),round(y+yoffset),image_xscale,image_yscale,image_angle,ubercolour,0.7*image_alpha);
}

