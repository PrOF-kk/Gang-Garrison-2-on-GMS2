if(owner.invisible)
    exit;

x = owner.x;
y = owner.y;

if team == TEAM_RED ubercolour = c_red;
if team == TEAM_BLUE ubercolour = c_blue;
draw_sprite_ext_overlay(sprite_index,overlays,owner.gearList,image_index,owner.x,owner.y,image_xscale,image_yscale,0,c_white,alpha);

var offset;
if !place_meeting(owner.x,owner.y+1,Obstacle)
    and!place_meeting(owner.x,owner.y+1,PlayerWallHorizontal)
    offset = 2;
else
    offset = 0;

draw_sprite_ext(BackstabLegsS, owner.team+offset,owner.x, owner.y,image_xscale,image_yscale,0,c_white,alpha);

if (owner.ubered)
{
    draw_sprite_ext_overlay(sprite_index,overlays,owner.gearList,image_index,owner.x,owner.y,image_xscale,image_yscale,image_angle,ubercolour,1);
    draw_sprite_ext(BackstabLegsS, owner.team+offset,owner.x,owner.y,image_xscale,image_yscale,0,ubercolour,0.7);
}


