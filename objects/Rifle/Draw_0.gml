event_inherited();
if (tracerAlpha > 0.05)
{
    shot = false;
    var origdepth;
    origdepth = depth;
    depth = -2;
    
    draw_set_alpha(tracerAlpha);
    if(owner.team == TEAM_RED)
        draw_line_width_color(shotx,shoty,x2,y2,2,c_red,c_red);
    else
        draw_line_width_color(shotx,shoty,x2,y2,2,c_blue,c_blue);
    if(global.particles != PARTICLES_OFF)
        tracerAlpha /= delta_mult(1.75);
    else tracerAlpha = 0;
        
    draw_set_alpha(1);
    depth = origdepth;
}
else
    tracerAlpha = 0;

if (owner.zoomed && owner == global.myself.object)
{
    if (hitDamage < maxDamage)
    {
        draw_set_alpha(0.25);
        draw_sprite_ext(ChargeS, 0, mouse_x + 15*-image_xscale, mouse_y - 10, -image_xscale, 1, 0, c_white, image_alpha);
        draw_set_alpha(0.8);
    }
    else
        draw_sprite_ext(FullChargeS, 0, mouse_x + 65*-image_xscale, mouse_y, 1, 1, 0, c_white, image_alpha);
        draw_sprite_part_ext(ChargeS, 1, 0, 0, ceil((hitDamage-baseDamage)*40/(maxDamage-baseDamage)), 20, mouse_x + 15*-image_xscale, mouse_y - 10, -image_xscale, 1, c_white, image_alpha);
}


