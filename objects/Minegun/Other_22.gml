action_inherited();
{
    write_ubyte(global.serializeBuffer, lobbed);
    with(Mine) {
        if(ownerPlayer == other.ownerPlayer) {
            event_user(12);
        }
    }
}

