function rotate_vec(_x, _y, angle){
	var clockwise=angle<0 ? -1 : 1, ax=_x;
	angle*=-clockwise
	_x= _x*dcos(angle)				-_y*dsin(angle)*clockwise
	_y= ax*dsin(angle)*clockwise	+_y*dcos(angle)
	
	return [_x, _y]
}

function sugar_add(val){
	o_Player.sugar+=val
}