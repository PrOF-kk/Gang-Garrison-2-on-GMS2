offset = (object_index == IntelligenceBlue); // +12 offset for blue intel
if(!offset and instance_exists(InvasionHUD))
    exit;

draw_sprite(sprite_index,image_index,x,y);
if (alarm[0] > 0)
    draw_intel_timer(offset, alarm[0]/900*global.delta_factor);

