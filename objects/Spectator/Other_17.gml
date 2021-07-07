for(i=1; i<=ds_list_size(global.players); i+=1)
{
    var newTrackId, newPlayer;
    newTrackId = (track_id + i) mod ds_list_size(global.players);
    newPlayer = ds_list_find_value(global.players, newTrackId);
    if(newPlayer.object and newPlayer != global.myself)
    {
        if(newPlayer.team == myTeam || myTeam == TEAM_SPECTATOR)
        {
            if(!tracking)
            {
                tracking = true;
            }
            track_id = newTrackId;
            player = newPlayer;
            break;
        }
    }
}

