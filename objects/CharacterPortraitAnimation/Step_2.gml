if !instance_exists(ClassSelectController) {
    instance_destroy()
        exit;
            }else{ //if it DOES exist
                if ClassSelectController.y !=120{ // and if it's if it's not fully pulled down
                    instance_destroy()
            }
}
if image_index+(global.myself.team)*(image_number*0.5)>=((global.myself.team+1)*(image_number/2))-1 {
image_speed=0
}

