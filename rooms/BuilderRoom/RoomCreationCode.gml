with(Builder) {
    if (visible) event_user(0);
    else {
        visible = true;
        resetToggles();
        CustomMapInit("Maps/ggb2_tmp_map.png");
        loadMetadata(Builder.metadata, true);
    }
}