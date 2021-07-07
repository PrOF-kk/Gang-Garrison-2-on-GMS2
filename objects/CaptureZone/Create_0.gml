// execute CP detection in a step's time
// this means capture zones are not order-sensitive for custom maps
alarm[0] = 1;

// It still needs a cp right away though.
event_perform(ev_alarm, 0);

