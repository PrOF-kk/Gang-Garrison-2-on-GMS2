while(!ds_queue_empty(workQueue))
{
    var item;
    item = ds_queue_dequeue(workQueue);
    buffer_destroy(ds_list_find_value(item, 1));
    ds_list_destroy(item);
}
ds_queue_destroy(workQueue);
socket_destroy(socket);
buffer_destroy(responseBuffer);

