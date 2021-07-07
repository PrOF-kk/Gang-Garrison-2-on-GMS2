function receivestring(argument0, argument1) {
	/* Receive a string with length prefix. Blocks until the complete string is read */

	var size,buffer,result;
	buffer = fct_buffer_create();
	if(receiveCompleteMessage(argument0, argument1, buffer) > 0) {
	    fct_buffer_destroy(buffer);
	    return "";
	}

	if(argument1 == 1) {
	    size = read_ubyte(buffer);
	} else {
	    size = read_ushort(buffer);
	}

	if(receiveCompleteMessage(argument0, size, buffer) > 0) {
	    fct_buffer_destroy(buffer);
	    return "";
	}

	result = read_string(buffer, size);
	fct_buffer_destroy(buffer);
	return result;



}
