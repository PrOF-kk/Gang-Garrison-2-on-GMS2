// Don't re-allow movement if there's another StabAnim running for the same player
with(StabAnim)
    if(id != other.id and owner == other.owner)
        exit;

ds_list_destroy(overlays);
        
owner.runPower = owner.baseRunPower;
owner.jumpStrength = owner.baseJumpStrength;
owner.stabbing = 0;

