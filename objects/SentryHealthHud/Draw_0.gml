if(global.myself.team == TEAM_BLUE)
    image_index = 1;
else
    image_index = 0;

if(global.myself.object == -1 or global.myself.class != CLASS_ENGINEER)
{
    instance_destroy();
    exit; 
}

if (global.myself.sentry)
{
    drawHealth(45, __view_get( e__VW.HView, 0 )-123, global.myself.sentry.hp, global.myself.sentry.maxHp);
    draw_sprite_ext(sprite_index, image_index, __view_get( e__VW.XView, 0 )+5, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-145, 2, 2, 0, c_white, 1);
}

