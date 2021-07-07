if (updating)
{
    if (button_x1 <= mouse_x && mouse_x <= button_x2 && button_y1 <= mouse_y && mouse_y <= button_y2)
        room_goto(UpdaterRoom);
}

