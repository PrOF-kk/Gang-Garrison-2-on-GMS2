if (global.backgroundHash != "default")
{
    // Load new background image
    oldBackground = menuimage;
    menuimage = background_add("background.png", false, false);
    global.downloadedBackground = menuimage;

}
else
{
    // Reset to default background
    oldBackground = menuimage;
    menuimage = choose(MenuBackground1, MenuBackground2);
}
fade = 1;

