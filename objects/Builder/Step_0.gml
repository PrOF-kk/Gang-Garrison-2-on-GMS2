if (!visible) exit;

var i, button, xOfsset, yOffset, ySize, xSize;
xOffset = view_xview[0] + startX[0];
ySize = view_hview[0];
yOffset = view_yview[0] + ySize;
xSize = view_wview[0];
canClick = true;
tooltipIdx = -1;

if (instance_exists(MenuController) || mouse_x > view_xview[0]+view_wview[0] || mouse_x < view_xview[0] || mouse_y > view_yview[0]+view_hview[0] || mouse_y < view_yview[0]) canClick = false;
else {
    if (keyboard_check(global.left) || keyboard_check(global.left2)) {
        view_xview[0] -= moveSpeed*global.delta_factor;
        event_user(1);
    } else if (keyboard_check(global.right) || keyboard_check(global.right2)) {
        view_xview[0] += moveSpeed*global.delta_factor;
        event_user(1);
    } 
    if (keyboard_check(global.jump) || keyboard_check(global.jump2)) {
        view_yview[0] -= moveSpeed*global.delta_factor;
        event_user(1);
    } else if (keyboard_check(global.down) || keyboard_check(global.down2)) {
        view_yview[0] += moveSpeed*global.delta_factor;
        event_user(1);
    }
    
    if (setOffsets && layerIndex < 7) {
        if (background_visible[layerIndex]) {
            selected = -1;
            mirrored = -1;
            if (dragging) {
                ParallaxController.background_xfactor[layerIndex] = max(0, min(10, ParallaxController.background_xfactor[layerIndex]-(holdX-mouse_x)/100));
                ParallaxController.background_yfactor[layerIndex] = max(0, min(10, ParallaxController.background_yfactor[layerIndex]+(holdY-mouse_y)/100));
                holdX = mouse_x;
                holdY = mouse_y;
                if (!mouse_check_button(mb_left))
                    dragging = false;
            } else if (mouse_check_button_pressed(mb_left)) {
                holdX = mouse_x;
                holdY = mouse_y;
                dragging = true;
            } else if (mouse_check_button_pressed(mb_right)) {
                dragging = false;
                setOffsets = false;
            }
        } else
            dragging = false;
    } else
        dragging = false;
}

if (expanded) {
    expandIdx = max(0, expandIdx - 0.05*global.delta_factor);
    
    if (expandIdx != 0 && expanded) {
        height = items*buttonHeight * sqrt(1-expandIdx*0.93);
        dragHeight = height;
    } else height = items*buttonHeight;
    
    if (holdHeader[0]) {
        if (toggleHeader && (abs(holdX-mouse_x) > 3 || abs(holdY-mouse_y) > 3)) toggleHeader = false;
        else if (!toggleHeader) {
            startX[0] += mouse_x-holdX;
            startX[0] = min(xSize-headerWidth, max(0, startX[0]));
            holdX = mouse_x;
            
            dragHeight -= mouse_y-holdY;
            holdY = mouse_y;
            dragHeight = min(ySize, max(buttonHeight, dragHeight));
            items = min(ceil(dragHeight/buttonHeight), ds_list_size(global.buttons));
            height = items*buttonHeight;
        }
        
        if (!mouse_check_button(mb_left)) {
            holdHeader[0] = false;
            if (toggleHeader) {
                expanded = !expanded;
                oldItems = items;
            }
        }
    } else if (!holdHeader[1] && !holdHeader[2]) {
        dragHeight = max(height, dragHeight - max(2, (dragHeight-height)/16)*global.delta_factor);
    
        if (mouse_x > xOffset && mouse_x < xOffset+buttonWidth) {
            if (mouse_y > yOffset-dragHeight-buttonHeight && mouse_y < yOffset-dragHeight) {
                canClick = false;
                if (mouse_check_button_pressed(mb_left)) {
                    holdHeader[0] = true;
                    toggleHeader = true;
                    holdX = mouse_x;
                    holdY = mouse_y;
                    canClick = false;
                }
            } else if (mouse_y > yOffset-height) {
                canClick = false;
                if (mouse_check_button_pressed(mb_left)) {
                    button = items - 1 - floor((yOffset-mouse_y)/height*items) + scrollIndex;
                    if (!buttons[button, TOGGLE]) {
                        execute_string(ds_map_find_value(ds_list_find_value(global.buttons, button), "code"), true);
                    } else {
                        buttons[button, TOGGLED] = execute_string(ds_map_find_value(ds_list_find_value(global.buttons, button), "code"), !buttons[button, TOGGLED]);
                    }
                }
            }
        } else if (mouse_x > xOffset+buttonWidth && mouse_x < xOffset+headerWidth) {
            if (mouse_y > yOffset-height) {
                if (mouse_check_button(mb_left)) scrollIndex = floor((1-(yOffset-mouse_y)/height)*(ds_list_size(global.buttons)-items));
                canClick = false;
            }
        }
    }
    
    if (!canClick) {
        if (mouse_wheel_up()) scrollIndex -= 1;
        else if (mouse_wheel_down()) scrollIndex += 1;
    }
    scrollIndex = max(0, min(ds_list_size(global.buttons)-floor(height/buttonHeight), scrollIndex));
} else {
    expandIdx = min(1, expandIdx + 0.05*global.delta_factor);
    height *= sqrt(1-expandIdx*0.93);
    dragHeight = height;
    items = min(ds_list_size(global.buttons), ceil(height/buttonHeight));
    
    if (mouse_x > xOffset && mouse_x < xOffset+buttonWidth) {
        if (mouse_y > yOffset-dragHeight-buttonHeight && mouse_y < yOffset-dragHeight) {
            if (mouse_check_button_pressed(mb_left)) {
                expanded = true;
                items = oldItems;
                canClick = false;
            }
        }
    }
}

// Not hovering over the button menu
if (canClick && !holdHeader[0] && !holdHeader[2]) {
    xOffset = view_xview[0] + startX[1];
    yOffset = view_yview[0] + startY[1];
    
    if (holdHeader[1]) {
        startX[1] += mouse_x-holdX;
        startX[1] = min(xSize-entityButtonSize*vItems-1, max(1, startX[1]));
        holdX = mouse_x;
        
        startY[1] += mouse_y-holdY;
        startY[1] = min(ySize-2*entityButtonSize-1, max(0, startY[1]));
        holdY = mouse_y;
        
        if (!mouse_check_button(mb_left)) holdHeader[1] = false;
    } else if (mouse_x > xOffset && mouse_x < xOffset+entityButtonSize*vItems) {
        if (mouse_y > yOffset+buttonHeight && mouse_y < yOffset+buttonHeight+entityButtonSize*ceil(entityButtonCount/vItems)) {
            i = floor((mouse_x-xOffset)/entityButtonSize) + floor((mouse_y-yOffset-buttonHeight)/entityButtonSize)*vItems;
            canClick = false;
            if (i < entityButtonCount) {
                tooltipIdx = i;
                if (mouse_check_button_pressed(mb_left)) {
                    if (selected != i) {
                        selected = i;
                        event_user(2);
                    }
                } else if (mouse_check_button_pressed(mb_right)) {
                    if (selected != i) {
                        selected = i;
                        event_user(2);
                    }
                    showPropertyMenu(selectedProperties, newProperties);
                    event_user(3);
                }
            }
        } else if (mouse_y > yOffset && mouse_y < yOffset+buttonHeight) {
            canClick = false;
            if (mouse_check_button_pressed(mb_left)) {
                holdHeader[1] = true;
                holdX = mouse_x;
                holdY = mouse_y;
            }
        }
    }
}

// Not hovering above the button menu or the entity menu
if (canClick && !holdHeader[0] && !holdHeader[1]) {
    xOffset = view_xview[0] + startX[2];
    yOffset = view_yview[0] + startY[2];
    
    if (holdHeader[2]) {
        canClick = false;
        startX[2] += mouse_x-holdX;
        startX[2] = min(xSize-layerWidth-1, max(1, startX[2]));
        holdX = mouse_x;
        
        startY[2] += mouse_y-holdY;
        startY[2] = min(ySize-layerHeight-buttonHeight-1, max(0, startY[2]));
        holdY = mouse_y;
        
        if (!mouse_check_button(mb_left)) holdHeader[2] = false;
    } else if (mouse_x > xOffset && mouse_x < xOffset+layerWidth) {
        if (mouse_x < xOffset+23) {
            if (mouse_y > yOffset+buttonHeight+3 &&  mouse_y < yOffset+buttonHeight+23) {
                canClick = false;
                if (mouse_check_button_pressed(mb_left) && layerIndex>0) // up
                    layerIndex-=1;
            } else if (mouse_y > yOffset+buttonHeight-23+layerHeight && mouse_y < yOffset+buttonHeight-3+layerHeight) {
                canClick = false;
                if (mouse_check_button_pressed(mb_left) && layerIndex<8) // down
                    layerIndex+=1;
            }          
        } else if (mouse_y > yOffset+buttonHeight-23+layerHeight && mouse_y < yOffset+buttonHeight-3+layerHeight) {
             if (mouse_x > xOffset+27 && mouse_x < xOffset+90) {
                canClick = false;
                if (mouse_check_button_pressed(mb_left)) {  // Clear
                    if (layerIndex == 8 && instance_exists(ParallaxController)) {
                        if (ParallaxController.foreground != -1) {
                            background_delete(ParallaxController.foreground);
                            ds_map_delete(Builder.metadata, "bg_foreground");
                            ParallaxController.foreground = -1;
                        }
                    } else if (layerIndex != 7 && ds_map_find_value(global.resources, "bg_layer" + string(layerIndex)) > 0) {
                        background_delete(ds_map_find_value(global.resources, "bg_layer" + string(layerIndex)));
                        ds_map_delete(global.resources, "bg_layer" + string(layerIndex));
                        ds_map_delete(Builder.metadata, "bg_layer" + string(layerIndex));
                        background_visible[layerIndex] = 0;
                    }
                }
             } else if (mouse_x > xOffset+97 && mouse_x < xOffset+157) {
                canClick = false;
                if (mouse_check_button_pressed(mb_left)) { // Offsets
                    // Save all offsets if we were editting them
                    if (setOffsets && instance_exists(ParallaxController)) {
                        for(i=0;i<7;i+=1){
                            if (background_visible[i]) {
                                if (is_string(ds_map_find_value(Builder.metadata, "layer" + string(i) + "xfactor")))
                                    ds_map_replace(Builder.metadata, "layer" + string(i) + "xfactor", string(ParallaxController.background_xfactor[i]));
                                else
                                    ds_map_add(Builder.metadata, "layer" + string(i) + "xfactor", string(ParallaxController.background_xfactor[i]));
                                if (is_string(ds_map_find_value(Builder.metadata, "layer" + string(i) + "yfactor")))
                                    ds_map_replace(Builder.metadata, "layer" + string(i) + "yfactor", string(ParallaxController.background_yfactor[i]));
                                else
                                    ds_map_add(Builder.metadata, "layer" + string(i) + "yfactor", string(ParallaxController.background_yfactor[i]));
                            }
                        }                        
                    }
                    setOffsets = !setOffsets;
                }
             }
        } else if (mouse_y > yOffset && mouse_y < yOffset+buttonHeight) {
            canClick = false;
            if (mouse_check_button_pressed(mb_left)) {
                holdHeader[2] = true;
                holdX = mouse_x;
                holdY = mouse_y;
            }
        } else if (mouse_y < yOffset+buttonHeight+layerHeight && mouse_y > yOffset+buttonHeight) {
            canClick = false;
            if (mouse_check_button_pressed(mb_left)) { // new resource
                var resource;
                resource = get_open_filename("Resource (PNG, GIF)|*.png;*.gif;","");
                if (resource == "")
                    exit;
                if (layerIndex == 8) {
                    ds_map_delete(Builder.metadata, "bg_foreground");
                    ds_map_add(Builder.metadata, "bg_foreground", resourceToString(resource));
                } else if (layerIndex == 7) {
                    Builder.mapBG = resource;
                    background_replace(BuilderBGB, resource, false, false);
                    background_xscale[7] = 6;
                    background_yscale[7] = 6;
                } else {
                    ds_map_delete(Builder.metadata, "bg_layer" + string(layerIndex));
                    ds_map_add(Builder.metadata, "bg_layer"+string(layerIndex), resourceToString(resource));
                }
                loadMetadata(Builder.metadata, true);
            }
            
            if (mouse_wheel_up() && layerIndex>0) layerIndex -= 1;
            else if (mouse_wheel_down() && layerIndex<8) layerIndex += 1;
        }
    }
    
    // Update the layername
    switch(layerIndex) {
        case 8: layerName = "FG"; break;
        case 7: layerName = "BG"; break;
        default: layerName = "L" + string(layerIndex+1);                
    }
}

// Not hovering over any menus
if (canClick) {
    if (mouse_check_button_pressed(mb_left) && selected != -1) {
        scaling = true;
        scaleX = round(mouse_x/6)*6;
        scaleY = round(mouse_y/6)*6;
        scaleLock = true;
    } else if (mouse_check_button_pressed(mb_right)) {
        scaling = false;
        erasing = true;
        scaleX = round(mouse_x/6)*6;
        scaleY = round(mouse_y/6)*6;
        selected = -1;
        mirrored = -1;
    }
}

// Fill in the selected area if the users stops scaling.
if ((mouse_check_button_released(mb_left) || !scale) && scaling) {
    scaling = false;
    if (scale && entityButtons[selected, SCALE] && !scaleLock) {
        var entity, entity2, xscale, yscale, _x, _y;
        _x = max(scaleX+6, round(mouse_x/6)*6+spriteCenterX);
        _y = max(scaleY+6, round(mouse_y/6)*6+spriteCenterY);
        xscale = (_x-scaleX) / spriteWidth;
        yscale = (_y-scaleY) / spriteHeight;
        placeEntity(scaleX-spriteCenterX+spriteOffsetX*xscale, scaleY-spriteCenterY+spriteOffsetY*yscale, xscale, yscale);        
        if (symmetry) 
            placeEntity(map_width()-scaleX+spriteCenterX+spriteOffsetX*xscale-(_x-scaleX), scaleY-spriteCenterY+spriteOffsetY*yscale, xscale, yscale, true);
    } else {
        var _x, _y, i, j, entity, entity2;
        _x = max(spriteWidth+scaleX, scaleX+ceil((mouse_x-scaleX)/spriteWidth)*spriteWidth);
        _y = max(spriteHeight+scaleY, scaleY+ceil((mouse_y-scaleY)/spriteHeight)*spriteHeight);

        for(i=scaleX-spriteCenterX; i+spriteCenterX<_x; i+=spriteWidth) {      
            for(j=scaleY-spriteCenterY; j+spriteCenterY<_y; j+=spriteHeight) {
                placeEntity(i+spriteOffsetX, j+spriteOffsetY, entityScale, entityScale);    
                if (symmetry)    
                    placeEntity(map_width()-i+mirroredOffsetX, j+spriteOffsetY, entityScale, entityScale, true);               
            }
        }
    }
} else if ((mouse_check_button_released(mb_right)) && erasing) {
    erasing = false;

    with(LevelEntity)
        if (collision_rectangle(other.scaleX, other.scaleY, mouse_x, mouse_y, id, false, false))
            instance_destroy();
    
    if (symmetry) {
        var _x;
        scaleX = map_width() - scaleX;
        _x = map_width() - mouse_x;

        with(LevelEntity)
            if (collision_rectangle(other.scaleX, other.scaleY, _x, mouse_y, id, false, false))
                instance_destroy();
    } 
}

