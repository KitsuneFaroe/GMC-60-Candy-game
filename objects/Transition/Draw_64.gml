if(alarm[1] >= 0){
	var trans_val = 2 - alarm[1]/in_time;
    
	in_effect(min(2, trans_val), in_data)
}

if(alarm[0] >= 0){
    var trans_val = 1 - (alarm[0]-1)/time;
    
	effect(min(1, trans_val), data)
}