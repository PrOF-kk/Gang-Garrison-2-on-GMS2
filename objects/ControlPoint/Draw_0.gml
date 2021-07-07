if team == -1 sprite_index = ControlPointNeutralS;
else if team == TEAM_RED sprite_index = ControlPointRedS;
else if team == TEAM_BLUE sprite_index = ControlPointBlueS;
draw_sprite(sprite_index,0,x,y);
draw_sprite_ext(sprite_index,1,x,y,1,1,0,c_white,alpha);

