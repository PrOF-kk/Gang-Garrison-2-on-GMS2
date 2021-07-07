// Make a "ghost" copy of our sprite.
// For Infiltrators only.
var ghost;
ghost = instance_create(x, y, SpyGhost);
// We don't have a Ghost image for every animation image of the Spy, so we just
// use the first one now.
ghost.image_index = 0;
ghost.image_xscale = image_xscale;
ghost.associatedCharacter = id;
if(stabbing)
    ghost.cloakAlpha = 1;
else
    ghost.cloakAlpha = cloakAlpha;


