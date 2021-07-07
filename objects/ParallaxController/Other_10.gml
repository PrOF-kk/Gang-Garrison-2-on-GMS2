// Take multistage maps into account.
yCenter = map_height()/2;
if global.totalMapAreas > 1 {
    if (global.currentMapArea >= global.totalMapAreas)
        yCenter = global.area[global.totalMapAreas] + (map_height() - global.area[global.totalMapAreas]) / 2;
    else
        yCenter = global.area[global.currentMapArea] + (global.area[global.currentMapArea+1] - global.area[global.currentMapArea]) / 2;
}

