if(global.isHost) {
    if (timeUnscathed < 7 * 30)
        hp += 3;
    else if (timeUnscathed < 14 * 30)
        hp += 4;
    else
        hp += 5;
    alarm[11] = 30 / global.delta_factor;
}

