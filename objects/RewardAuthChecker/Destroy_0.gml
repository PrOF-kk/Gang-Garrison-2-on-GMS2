while(!ds_queue_empty(workQueue))
{
    var item;
    item = ds_queue_dequeue(workQueue);
    fct_buffer_destroy(ds_list_find_value(item, 1));
    ds_list_destroy(item);
}
ds_queue_destroy(workQueue);
socket_destroy(socket);
fct_buffer_destroy(responseBuffer);

