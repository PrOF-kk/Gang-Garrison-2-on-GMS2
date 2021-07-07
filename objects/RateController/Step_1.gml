if(global.game_fps == 60)
{
    global.delta_factor = 1/2;
    global.skip_delta_factor = 1/2;
    global.ticks_per_virtual = 2;
    global.frameskip = 1;
    room_speed = 60;
}
else // 30fps
{
    global.delta_factor = 1;
    global.skip_delta_factor = 1/2;
    global.ticks_per_virtual = 1;
    global.frameskip = 2;
    room_speed = 30;
}


