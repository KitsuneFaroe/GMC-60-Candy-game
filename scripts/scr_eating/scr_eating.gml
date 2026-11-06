function eating_candy(){
	var _frac = 1/alarm[0]
	if(instance_exists(eater)){
		var sugar_exchange = ceil(sugar * _frac)
		sugar -= sugar_exchange
		eater.sugar_add(sugar_exchange)
	}
}

function reload_pos(){
	var _vec = rotate_vec(xoffset*image_xscale, yoffset*image_yscale, image_angle)
	x = real_x +_vec[0]
	y = real_y +_vec[1]
}