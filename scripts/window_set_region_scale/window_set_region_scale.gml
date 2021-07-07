// If the window is larger than the actual room normally the room is displayed in a region
// centered in the window. It is though possible to indicate that it must be scaled to fill
// the whole or part of the window. A value of 1 is no scaling. If you use a value of 0
// the region will be scaled to fill the whole window. If you set it to a negative value it
// will be scaled to the maximal size inside the window while maintaining the aspect ratio
// (this is often what you want). adaptwindow indicates whether the window size must be adapted
// if the scaled room does not fit in. Adapting the window is only effective when the scale factor is positive.
function window_set_region_scale(scale, adaptwindow) {

}