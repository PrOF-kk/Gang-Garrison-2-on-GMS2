image_speed = 0;
image_alpha *= 0.9;
image_alpha -= 0.01;
if(image_alpha <= 0)
    instance_destroy();

// make a list of all ghosts of our same spy and destroy all but the oldest one (even if one is ourself)
var temp, array, number;
temp = ds_list_create();

with(SpyGhost)
    if (associatedCharacter == other.associatedCharacter)
        ds_list_add(temp, id);

ds_list_sort(temp, false);
ds_list_delete(temp, 0); // delete oldest one
number = ds_list_size(temp);

for(i = 0; i < number; i += 1) // dump list into array to avoid potential memory leak
    array[i] = ds_list_find_value(temp, i);
ds_list_destroy(temp);

for(i = 0; i < number; i += 1)
    with(array[i])
        instance_destroy();


