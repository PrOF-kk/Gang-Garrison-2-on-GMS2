if(vspeed > 0)
{
    var chuteIndex;
    chuteIndex = ceil(vspeed/10*3)-1;
    image_index = chuteIndex + (team==TEAM_BLUE)*3;
    sprite_index = ParachuteSentry;
}
else
{
    if (team == TEAM_BLUE)
        sprite_index = SentryBlue;
    if (team == TEAM_RED)
        sprite_index = SentryRed;
}
xr = round(x);
yr = round(y);
if global.myself.team == team draw_healthbar(xr-10, yr-30, xr+10, yr-25,hp*100/maxHp,c_black,c_red,c_green,0,true,true);
if (built && hp < .75 * maxHp) draw_sprite_part_ext(FlameS, random(4), 0, 0, 21, 9, xr-21/2, yr-15, 1, 1, c_white, 1 - (hp / maxHp));
draw_sprite_ext(sprite_index,image_index,xr,yr,image_xscale,image_yscale,image_angle,c_white,1);

if(distance_to_point(mouse_x, mouse_y)<25 && global.myself.team == team) {
    draw_set_alpha(1);   
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom); 
    if(team==TEAM_RED) {
        draw_set_color(c_red);
    } else {
        draw_set_color(c_blue);
    }
    draw_text(xr, yr-45, string_hash_to_newline(sanitiseNewlines(ownerPlayer.name) + "'s"));
    draw_text(xr, yr-35, string_hash_to_newline("Autogun"));
}

