// change preview image etc when a new entity is selected.

button = ds_list_find_value(global.entityData, entityButtons[selected, INDEX]);
selectedSprite = ds_map_find_value(button, "entity_sprite");
selectedImage = ds_map_find_value(button, "entity_image");
selectedProperties = ds_map_find_value(button, "properties");
ds_map_clear(newProperties);

spriteWidth = sprite_get_width(selectedSprite);
spriteHeight = sprite_get_height(selectedSprite)
spriteCenterX = round(sprite_get_width(selectedSprite)/12)*6;
spriteCenterY = round(sprite_get_height(selectedSprite)/12)*6;
spriteOffsetX = sprite_get_xoffset(selectedSprite);
spriteOffsetY = sprite_get_yoffset(selectedSprite);
entityScale = 1;

//Mirrored offsets, they have to be used because the ones above are rounded
mirroredCenterX = -spriteCenterX;
mirroredOffsetX = spriteOffsetX - sprite_get_width(selectedSprite);

// Mirror entities and invert their behaviour if possible
var name, data;
name = mirrorEntity(ds_list_find_value(global.entities, entityButtons[selected, INDEX]));
data = getEntityData(name);
if (data == -1) mirrored = -1;
else {
    mirrored = ds_list_find_index(global.entities, name);
    mirroredSprite = ds_map_find_value(data, "entity_sprite");
    mirroredImage = ds_map_find_value(data, "entity_image");
}

