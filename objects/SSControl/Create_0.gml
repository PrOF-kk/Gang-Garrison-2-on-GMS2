{
    if(instance_number(SSControl)) > 1 {
        instance_destroy();
    }
    if(!directory_exists(working_directory + "\\Screenshots")) directory_create(working_directory + "\\Screenshots");
}

