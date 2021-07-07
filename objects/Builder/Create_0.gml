// Presets
metadata = ds_map_create();
ds_map_add(metadata, "type", "meta");
ds_map_add(metadata, "background", "ffffff");
ds_map_add(metadata, "void", "000000");

unloadResources();
newProperties = ds_map_create();

// Window logic
tooltipIdx = -1;
expanded = 1;
expandIdx = 1;
canClick = true;

entityButtonSize = 28;
buttonWidth = 115;
headerWidth = 122;
buttonHeight = 17;
buttonSpriteWidth = 17;
layerHeight = 80;
layerWidth = 160;

vItems = 5; // entity menu (rowsize)
entityButtonCount = 0;
items = 5;  // button menu default
oldItems = items;
height = items*buttonHeight;
dragHeight = 0;
scrollIndex = 0;
layerName = "BG";
layerIndex = 7;

holdHeader[0] = false;
holdHeader[1] = false;
holdHeader[2] = false;
holdX = -1;
holdY = -1;

startX[0] = 0;
startX[1] = 0; // Also gets set in event_user(0)
startX[2] = 0;
startY[1] = 0;
startY[2] = 0;

// Builder logic
erasing = false;
scaling = false;
dragging = false;
snapScaling = false;
scaleLock = true;
showWM = false;
showGrid = false;
setOffsets = false;
scaleX = -1;
scaleY = -1;
entityScale = 1;
moveSpeed = 32;
mapBG = "";
mapWM = "";
wmString = "";

// vars for displaying the selected entity
spriteWidth = -1;
spriteHeight = -1;
spriteCenterX = -1;
spriteCenterY = -1;
spriteOffsetX = -1;
spriteOffsetY = -1;
mirroredCenterX = -1;
mirroredOffsetX = -1;
selected = -1;
selectedSprite = -1;
selectedImage = -1;
selectedProperties = -1;
mirrored = -1;
mirroredSprite = -1;
mirroredImage = -1;

