if (burnDuration != 0) {
    for(i = 0; i < numFlames; i += 1)
    {
        flameArray_x[i] = random_range(-(right_bound_offset - left_bound_offset)/2, (right_bound_offset - left_bound_offset)/2);
        flameArray_y[i] = random_range(-(bottom_bound_offset - top_bound_offset)/2, (bottom_bound_offset - top_bound_offset)/2);
    }
}
alarm[5] = 30 / global.delta_factor;

