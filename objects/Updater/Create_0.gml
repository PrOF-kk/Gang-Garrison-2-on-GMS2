// Downloading code. 

var downloadHandle, url, tmpfile, window_oldshowborder, window_oldfullscreen;
timeLeft = 0;
AudioControlPlaySong(-1, false);
window_oldshowborder = window_get_showborder();
window_oldfullscreen = window_get_fullscreen();
window_set_fullscreen(false);
window_set_showborder(false);

if(global.updaterBetaChannel)
    url = UPDATE_SOURCE_BETA;
else
    url = UPDATE_SOURCE;

tmpfile = temp_directory + "\\gg2update.zip";
    
downloadHandle = http_new_get(url);

while(!http_step(downloadHandle)) 
{ // while download isn't finished
    sleep(floor(1000/30) / global.delta_factor); // sleep for the equivalent of one frame
    io_handle(); // this prevents GameMaker from appearing locked-up
    
    // check if the user cancelled the download with the esc key
    if(keyboard_check(vk_escape)) 
    {
        http_destroy(downloadHandle);
        window_set_showborder(window_oldshowborder);
        window_set_fullscreen(window_oldfullscreen);
        room_goto_fix(Menu);
        exit;
    }
    
    draw_sprite(UpdaterBackgroundS,0,0,0);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_center);
    var progress, size;
    progress = http_response_body_progress(downloadHandle);
    size = http_response_body_size(downloadHandle);
    // If the URL we fetch is a redirect with no body, size might briefly be 0
    // Also, Faucet HTTP reports an unknown size as -1
    if (size > 0)
    {
        progressBar = floor((progress/size) * 21);
        offset = 5;
        for(i=0;i<progressBar;i+=1){
            draw_sprite(UpdaterProgressS,0,x+offset,y);
            offset+=12;
        }
        draw_text(x,y-20,string_hash_to_newline(string(floor(progress/power(2,20))) + "MB / " + string(floor(size/power(2,20))) + "MB  -  " + string(floor((progress/size)*100))+"% complete..."));
    }
    screen_refresh();
}
// Errored
if (http_status_code(downloadHandle) != 200)
{
    show_message("Downloading update failed!#" + string(http_status_code(downloadHandle)) + " " + http_reason_phrase(downloadHandle));
    http_destroy(downloadHandle);
    window_set_showborder(window_oldshowborder);
    window_set_fullscreen(window_oldfullscreen);
    room_goto_fix(Menu);
    exit;
}

write_buffer_to_file(http_response_body(downloadHandle), tmpfile);
http_destroy(downloadHandle);

if(!file_exists(tmpfile))
{
    window_set_showborder(window_oldshowborder);
    window_set_fullscreen(window_oldfullscreen);
    show_message("Error updating: Missing gg2update.zip in temp directory, download failed(?)");
    room_goto_fix(Menu);
    exit;
}

// rename existing "Gang Garrison 2.exe" to avoid conflict when extracting
if (file_exists("Gang Garrison 2.exe"))
{
    var newName, n;
    n = 1;
    
    // increment until unused name found
    do
    {
        newName = "gg2-old.delete.me." + string(n);
        n += 1;
    }
    until(!file_exists(newName));

    file_rename("Gang Garrison 2.exe", newName);
}



// let's extract the downloaded file now.
extractzip(tmpfile, working_directory);

// run new version    
execute_program("Gang Garrison 2.exe", "", false);

// exit
game_end();

