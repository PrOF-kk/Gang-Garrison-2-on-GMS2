workQueue = ds_queue_create();

// Socket is 0 => not currently waiting for an answer
socket = 0;
currentPlayer = noone;
responseBuffer = fct_buffer_create();

