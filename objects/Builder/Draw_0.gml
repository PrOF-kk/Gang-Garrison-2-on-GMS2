var i, j, button, xOfsset, yOffset, _y, scrollHeight, sectionHeight, xr, yr;
xr = round(mouse_x/6)*6;
yr = round(mouse_y/6)*6
draw_set_alpha(1);
draw_set_valign(fa_left);
draw_set_halign(fa_top);

// Draw the wallmask
if (showWM)
    draw_background_ext(BuilderWMB, 0, 0, 6, 6, 0, c_white, 1);

// Draw the grid (draw_sprite_tiled and draw_background_tiled both crash the game because the room is too big, so do it manually)
if (showGrid) {
    xOffset = floor(__view_get( e__VW.XView, 0 )/12)*12;
    yOffset = floor(__view_get( e__VW.YView, 0 )/12)*12;
    for(i=0;i<=__view_get( e__VW.WView, 0 )/12;i+=1) {
        for(j=0;j<__view_get( e__VW.HView, 0 )/12+12;j+=1) {
            draw_sprite(GridS, 0, xOffset+i*12, yOffset+j*12);
        }
    }
}

//********** OFFSET MARKERS **********\\
if (setOffsets) {
    draw_sprite(SpectatorCrosshairS, 1, map_width()/2, map_height()/2);
    if (layerIndex < 7) {
        if (__background_get( e__BG.Visible, layerIndex )) {
            draw_sprite(SpectatorCrosshairS, 0, map_width()/2 + round(__background_get( e__BG.X, layerIndex )), map_height()/2 + round(__background_get( e__BG.Y, layerIndex )));
            draw_set_color(make_color_rgb(159, 159, 159));
            draw_rectangle(round(mouse_x)+10, round(mouse_y)+10, round(mouse_x)+75, round(mouse_y)+43, false);
            draw_set_color(make_color_rgb(63, 63, 63));
            draw_rectangle(round(mouse_x)+10, round(mouse_y)+10, round(mouse_x)+75, round(mouse_y)+43, true);
            draw_text(round(mouse_x)+13, round(mouse_y)+13, string_hash_to_newline("X: " + string(ParallaxController.background_xfactor[layerIndex])));
            draw_text(round(mouse_x)+13, round(mouse_y)+30, string_hash_to_newline("Y: " + string(ParallaxController.background_yfactor[layerIndex])));
        }
    }
}

//********** SELECTED ENTITY **********\\
if (canClick && selected != -1) {   
    if (!scaling || entityButtons[selected, SCALE]) {
        // Scaled preview
        var _x, _y, xscale, yscale;
        
        // Unlock scaling if the user moves their mouse
        if (scaleLock && (abs(mouse_x-scaleX) > 3 || abs(mouse_y-scaleY) > 3))
            scaleLock = false;
            
        if (!scaling || scaleLock) {
            scaleX = xr;
            scaleY = yr;
            _x = xr + spriteWidth;
            _y = yr + spriteHeight;
        } else {
            _x = max(scaleX+6, xr+spriteCenterX);
            _y = max(scaleY+6, yr+spriteCenterY);
        }
        if (entityScale == 1) {
            xscale = (_x-scaleX) / spriteWidth;
            yscale = (_y-scaleY) / spriteHeight;
        } else {
            xscale = entityScale;
            yscale = entityScale;
        }
        
        draw_sprite_ext(selectedSprite, selectedImage, scaleX-spriteCenterX+spriteOffsetX*xscale, scaleY-spriteCenterY+spriteOffsetY*yscale, xscale, yscale, 0, c_white, 0.8);
        if (symmetry && mirrored != -1) draw_sprite_ext(mirroredSprite, mirroredImage, map_width()-scaleX-mirroredCenterX+spriteOffsetX*xscale-(_x-scaleX), scaleY-spriteCenterY+spriteOffsetY*yscale, xscale, yscale, 0, c_white, 0.4);
    } else {
        // Tiled preview 
        var _x, _y, i, j; 
        _x = scaleX + max(spriteWidth, ceil((mouse_x-scaleX)/spriteWidth)*spriteWidth);
        _y = scaleY + max(spriteHeight, ceil((mouse_y-scaleY)/spriteHeight)*spriteHeight);
        for(i=scaleX-spriteCenterX; i+spriteCenterX<_x; i+=spriteWidth) {      
            for(j=scaleY-spriteCenterY; j+spriteCenterY<_y; j+=spriteHeight) {
                draw_sprite_ext(selectedSprite, selectedImage, i+spriteOffsetX, j+spriteOffsetY, entityScale, entityScale, 0, c_white, 0.8);
                if (symmetry && mirrored != -1) draw_sprite_ext(mirroredSprite, mirroredImage, map_width()-i+mirroredOffsetX, j+spriteOffsetY, entityScale, entityScale, 0, c_white, 0.4);
            }
        }
    }
    
    // Rectangle showing the selected area
    draw_set_color(c_green);
    draw_rectangle(scaleX-spriteCenterX, scaleY-spriteCenterY, _x-spriteCenterX, _y-spriteCenterY, true);
    draw_set_color(c_red);
    if (symmetry && mirrored != -1) draw_rectangle(map_width()-scaleX-mirroredCenterX, scaleY-spriteCenterY, map_width()-_x-mirroredCenterX, _y-spriteCenterY, true);
} else if (canClick && erasing) {
    draw_set_color(c_green);
    draw_rectangle(scaleX, scaleY, xr, yr, true);
    draw_set_alpha(0.2);
    draw_rectangle(scaleX, scaleY, xr, yr, false);
    
    if (symmetry) {
        draw_set_color(c_red);
        draw_set_alpha(0.5);
        draw_rectangle(map_width()-scaleX, scaleY, map_width()-xr, yr, true);
        draw_set_alpha(0.1);
        draw_rectangle(map_width()-scaleX, scaleY, map_width()-xr, yr, false);
    }
    draw_set_alpha(1);
}

//********** BUTTON MENU **********\\
xOffset = __view_get( e__VW.XView, 0 ) + startX[0];
yOffset = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 );

if (expanded || expandIdx < 1) {
    // Background
    draw_set_color(make_color_rgb(159, 159, 159));
    draw_rectangle(xOffset, yOffset-dragHeight, xOffset+headerWidth, yOffset, false);
    draw_set_color(make_color_rgb(63, 63, 63));
    draw_rectangle(xOffset, yOffset-dragHeight, xOffset+headerWidth, yOffset, true);
    
    // Scrollbar
    sectionHeight = max(2, items / ds_list_size(global.buttons) * (height-5));
    if (ds_list_size(global.buttons) == items) scrollHeight = 0;
    else scrollHeight = ((height-5) - sectionHeight) / (ds_list_size(global.buttons)-items);
    draw_rectangle(xOffset+buttonWidth+1, yOffset-height+2+scrollHeight*scrollIndex, xOffset+headerWidth-2, yOffset-height+2+sectionHeight+scrollHeight*scrollIndex, false);
    
    // Buttons
    for(i=0; i<items; i+=1) {
        if (expandIdx != 0 && expanded) _y = yOffset-i*buttonHeight*sqrt(1-expandIdx*0.93);
        else _y = yOffset-i*buttonHeight;
        button = items - 1 - i + scrollIndex;
        draw_sprite_ext(gbButtonS, 0+buttons[button, TOGGLED]*3, xOffset, _y-buttonHeight, 1, 1, 0, c_white, 1);
        draw_sprite_ext(gbButtonS, 1+buttons[button, TOGGLED]*3, xOffset+buttonSpriteWidth, _y-buttonHeight, buttonWidth/buttonSpriteWidth-2, 1, 0, c_white, 1);
        draw_sprite_ext(gbButtonS, 2+buttons[button, TOGGLED]*3, xOffset-buttonSpriteWidth+buttonWidth, _y-buttonHeight, 1, 1, 0, c_white, 1);
        draw_text(xOffset+2, _y-buttonHeight+3, string_hash_to_newline(string(buttons[button, TEXT])));
    }
}
draw_sprite_ext(gbMenuLayoutS, 0, xOffset, yOffset - (dragHeight+buttonHeight), 1, 1, 0, c_white, 1);
draw_sprite_ext(gbMenuLayoutS, 1, xOffset+buttonSpriteWidth, yOffset - (dragHeight+buttonHeight), headerWidth/(buttonSpriteWidth-1)-2, 1, 0, c_white, 1);
draw_sprite_ext(gbMenuLayoutS, 2, xOffset-buttonSpriteWidth+headerWidth+1, yOffset - (dragHeight+buttonHeight), 1, 1, 0, c_white, 1);

//********** LAYER MENU **********\\
xOffset = __view_get( e__VW.XView, 0 ) + startX[2];
yOffset = __view_get( e__VW.YView, 0 ) + startY[2];

draw_sprite_ext(gbMenuLayoutS, 0, xOffset, yOffset, 1, 1, 0, c_white, 1);
draw_sprite_ext(gbMenuLayoutS, 1, xOffset+buttonSpriteWidth, yOffset, layerWidth/(buttonSpriteWidth-1)-2, 1, 0, c_white, 1);
draw_sprite_ext(gbMenuLayoutS, 2, xOffset-buttonSpriteWidth+layerWidth+1, yOffset, 1, 1, 0, c_white, 1);

// Background
draw_set_color(make_color_rgb(159, 159, 159));
draw_rectangle(xOffset, yOffset+buttonHeight, xOffset+layerWidth, yOffset+layerHeight+buttonHeight, false);
draw_set_color(make_color_rgb(63, 63, 63));
draw_rectangle(xOffset, yOffset+buttonHeight, xOffset+layerWidth, yOffset+layerHeight+buttonHeight, true);

// Scrollbuttons
draw_rectangle(xOffset+3, yOffset+buttonHeight+3, xOffset+23, yOffset+buttonHeight+23, (layerIndex>0));
if (layerIndex > 0)
    draw_sprite(ScrollButtonS, 0, xOffset+13, yOffset+buttonHeight+13);
draw_rectangle(xOffset+3, yOffset+buttonHeight-3+layerHeight, xOffset+23, yOffset+buttonHeight-23+layerHeight, (layerIndex<8));
if (layerIndex < 8)
    draw_sprite(ScrollButtonS, 1, xOffset+13, yOffset+buttonHeight-13+layerHeight);

// Clear & offsets button
draw_rectangle(xOffset+27, yOffset+buttonHeight-3+layerHeight, xOffset+90, yOffset+buttonHeight-23+layerHeight, true);
draw_rectangle(xOffset+97, yOffset+buttonHeight-3+layerHeight, xOffset+157, yOffset+buttonHeight-23+layerHeight, true);

// Text
draw_text(xOffset+40, yOffset+buttonHeight-18+layerHeight, string_hash_to_newline("Clear"));
if (!setOffsets)
    draw_text(xOffset+100, yOffset+buttonHeight-18+layerHeight, string_hash_to_newline("Offsets"));
else
    draw_text(xOffset+110, yOffset+buttonHeight-18+layerHeight, string_hash_to_newline("Save"));
draw_text(xOffset+6, yOffset+buttonHeight + 35, string_hash_to_newline(layerName));

// Layer preview
var bgScale, bg;
bgScale = 131/background_get_width(BuilderBGB);
if (bgScale > 51/background_get_height(BuilderBGB))
    bgScale = 51/background_get_height(BuilderBGB);

bg = -1;
if (layerIndex == 8 && instance_exists(ParallaxController))
    bg = ParallaxController.foreground;
else if (__background_get( e__BG.Visible, layerIndex ))
    bg = __background_get( e__BG.Index, layerIndex );
if (bg > 0)
    draw_background_ext(bg, xOffset+27, yOffset+buttonHeight+3, bgScale, bgScale, 0, c_white, 1);
else
    draw_rectangle(xOffset+27, yOffset+buttonHeight+3, xOffset+154, yOffset+buttonHeight+54, false);

//********** ENITITY MENU  **********\\
xOffset = __view_get( e__VW.XView, 0 ) + startX[1];
yOffset = __view_get( e__VW.YView, 0 ) + startY[1];

draw_sprite_ext(gbMenuLayoutS, 0, xOffset, yOffset, 1, 1, 0, c_white, 1);
draw_sprite_ext(gbMenuLayoutS, 1, xOffset+buttonSpriteWidth, yOffset, entityButtonSize*vItems/(buttonSpriteWidth-1)-2, 1, 0, c_white, 1);
draw_sprite_ext(gbMenuLayoutS, 2, xOffset-buttonSpriteWidth+entityButtonSize*vItems+1, yOffset, 1, 1, 0, c_white, 1);

// Background
draw_set_color(make_color_rgb(159, 159, 159));
draw_rectangle(xOffset, yOffset+buttonHeight, xOffset+vItems*entityButtonSize, yOffset+buttonHeight+ceil(entityButtonCount/vItems)*entityButtonSize, false);
draw_set_color(make_color_rgb(63, 63, 63));
draw_rectangle(xOffset, yOffset+buttonHeight, xOffset+vItems*entityButtonSize, yOffset+buttonHeight+ceil(entityButtonCount/vItems)*entityButtonSize, true);

// Buttons
for(j=0; j<entityButtonCount/vItems; j+=1) {
    for(i=0; i<vItems && j*vItems + i < entityButtonCount; i+=1) {
        draw_sprite(entityButtons[j*vItems+i, SPRITE], entityButtons[j*vItems+i, IMAGE] + (selected != j*vItems+i), xOffset+i*entityButtonSize, yOffset+buttonHeight+j*entityButtonSize);
    }
}

// Tooltip
if (tooltipIdx >= 0) {
    if (is_string(entityButtons[tooltipIdx, TOOLTIP])) {
        var x2, y2;
        if (mouse_x-__view_get( e__VW.XView, 0 )+string_width(string_hash_to_newline(entityButtons[tooltipIdx, TOOLTIP]))+14 > __view_get( e__VW.WView, 0 )) x2 = mouse_x - string_width(string_hash_to_newline(entityButtons[tooltipIdx, TOOLTIP])) - 12;
        else x2 = mouse_x+12;
        y2 = round(mouse_y-string_height(string_hash_to_newline(entityButtons[tooltipIdx, TOOLTIP]))/2);    // round to prevent gm from squishing the text
        draw_rectangle(x2-2, y2-2, x2+string_width(string_hash_to_newline(entityButtons[tooltipIdx, TOOLTIP]))+2, y2+string_height(string_hash_to_newline(entityButtons[tooltipIdx, TOOLTIP]))+2, false);
        draw_set_color(c_white);
        draw_text(x2, y2, string_hash_to_newline(entityButtons[tooltipIdx, TOOLTIP]));
    }
}

/* */
/*  */
