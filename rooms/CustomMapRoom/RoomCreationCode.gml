var path;

// internal map
if (global.currentMapMD5 == "")
{
    var filename;
    filename = findInternalMapName(global.currentMap);
    path = temp_directory + "\\" + filename;
    // file not already in temp directory, export it
    if (!file_exists(path))
        export_include_file_location(filename, path);
}
else
// custom map
{
    path = "Maps/" + global.currentMap + ".png";
}

CustomMapInit(path);
basicRoomSetup();
instance_create(0,0,CustomMapO);