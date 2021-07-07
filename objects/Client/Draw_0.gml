if(room==DownloadRoom)
{
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_rectangle(50, 550, 300, 560, 2);
    
    if(downloadingMap)
    {
        draw_text(50, 530, string_hash_to_newline("Downloading map (press Esc to abort)"));
        if(downloadMapBytes > 0)
            draw_rectangle(50, 550, 50+buffer_size(downloadMapBuffer)/downloadMapBytes * 250, 560, 0);
    }
    else
        draw_text(50, 530, string_hash_to_newline("Connecting (press Esc to abort)"));
}

