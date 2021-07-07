{
    if(other.team != team and !other.stickied and !other.bubbled)
    {
        with(other)
        {
            hspeed *= -1;
            vspeed *= -1;
            bubbled = true;
            reflector = other.ownerPlayer;
        }
    }
    if (alarm[0] > 10) {
        alarm[0] = alarm[0] div 2;
    }
    else {
        instance_destroy();
    }
}

