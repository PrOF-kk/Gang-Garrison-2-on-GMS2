
// Look for new resources

var resource, sprite, resourceString;
resource = ds_map_find_value(newProperties, "resource");
sprite = -1;

if (is_string(resource) && Builder.metadata != -1)
{
    sprite = ds_map_find_value(global.resources, resource);
    if (sprite <= 0)
    {
        resourceString = ds_map_find_value(Builder.metadata, resource);
        if (is_string(resourceString))
        {
            sprite = stringToResource(resourceString);
            ds_map_add(global.resources, resource, sprite);
        }
    }
    
    if (sprite > 0)
    {
        entityScale = max(1, readProperty(newProperties, "scale", REAL, 1));
        
        selectedSprite = sprite;
        selectedImage = 0;
        
        spriteWidth = sprite_get_width(selectedSprite)*entityScale;
        spriteHeight = sprite_get_height(selectedSprite)*entityScale;
        spriteCenterX = round(sprite_get_width(selectedSprite)*entityScale/12)*6;
        spriteCenterY = round(sprite_get_height(selectedSprite)*entityScale/12)*6;
        spriteOffsetX = sprite_get_xoffset(selectedSprite)*entityScale;
        spriteOffsetY = sprite_get_yoffset(selectedSprite)*entityScale;
        
        // Mirrored offsets, they have to be used because the ones above are rounded
        mirroredCenterX = -spriteCenterX;
        mirroredOffsetX = spriteOffsetX - sprite_get_width(selectedSprite)*entityScale;
        
        // Mirrored entities have the same sprite
        mirroredSprite = sprite;
        mirroredImage = 0;
    }
    else 
        event_user(2);  // Reset
}

