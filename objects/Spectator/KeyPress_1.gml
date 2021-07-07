if(!instance_exists(MenuController))
    exit;

var i;
for(i=0; i<=9; i+=1)
{
    if(keyboard_check_pressed(numpadKeys[i]))
    {
        if(savex_view[i] == -1)
        {
            savex_view[i] = x;
            savey_view[i] = y;
            if(!instance_exists(NoticeO))
                instance_create(0,0,NoticeO);
            with(NoticeO)
                notice = NOTICE_SETCHECKPOINT;
        }
        else if(x != savex_view[i] || y != savey_view[i])
        {
            x = savex_view[i];
            y = savey_view[i];
        }
        else
        {
            savex_view[i] = -1;
            savey_view[i] = -1;
            if(!instance_exists(NoticeO))
                instance_create(0,0,NoticeO);
            with(NoticeO)
                notice = NOTICE_DESTROYCHECKPOINT;
        }
        tracking=false;
    }
}

