switch (global.paramCharacter.player.class)
{
    case CLASS_SCOUT:
        sprite_index = TombstoneScoutS;
        break;
    case CLASS_SOLDIER:
        sprite_index = TombstoneSoldierS;
        break;
    case CLASS_SNIPER:
        sprite_index = TombstoneSniperS;
        break;
    case CLASS_DEMOMAN:
        sprite_index = TombstoneDemomanS;
        break;
    case CLASS_MEDIC:
        sprite_index = TombstoneMedicS;
        break;
    case CLASS_ENGINEER:
        sprite_index = TombstoneEngineerS;
        break;
    case CLASS_HEAVY:
        sprite_index = TombstoneHeavyS;
        break;
    case CLASS_SPY:
        sprite_index = TombstoneSpyS;
        break;
    case CLASS_PYRO:
        sprite_index = TombstonePyroS;
        break;
    default: // not all classes supported
        show_message("Unsupported class: " + string(global.paramCharacter.player.class));
        instance_destroy();
}

alarm[0] = 300/global.delta_factor;
image_speed = 1/(3 * global.ticks_per_virtual);
image_xscale = 2;
image_yscale = 2;

wallSetSolid();

with(global.paramCharacter)
{
    var oldx, oldy;
    oldx = x;
    oldy = y;
    
    if(place_free(x,y))
        really_move_contact_solid(270, -1);
    
    other.x = x;
    other.y = y+bottom_bound_offset-1;
        
    x = oldx;
    y = oldy;
}
    
wallUnsetSolid();

