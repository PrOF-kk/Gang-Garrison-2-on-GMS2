{
    if(instance_number(AudioControl)) > 1 {
        instance_destroy();
    }
    
    currentSong = -1;
    currentSongLoop = false;
    currentSongPlayed = true;
    allAudioMuted = false;
}

