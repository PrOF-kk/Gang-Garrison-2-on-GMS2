{
    if (other.team != team)
    {
        with(other)
        {
            dealFlicker(id);
        }
        characterHit = other.id;
        other.solid = true;
        really_move_contact_solid(direction, speed);
        other.solid = false;
        
        with(other) motion_add(other.direction, 2);
        
        event_user(5);
    }
    else if (ds_list_find_index(playersPassed, other.player) == -1 and other.player != ownerPlayer)
    {
        ds_list_add(playersPassed, other.player);
        distanceToTravel -= 100;
    }
}

