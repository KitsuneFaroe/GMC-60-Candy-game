function calculate_tail(_array, _values, anglet){
	var prev_x = _array[0]
	var prev_y = _array[1]
	var prev_a = _array[2]
	var i = 1
	repeat(array_length(_array)/3 -1){
		var i3 = i*3
		var _base_angle = _array[i3-1] + _values[(i<<1)+1]
		var _a = point_direction(_array[i3-3],_array[i3-2], _array[i3], _array[i3+1])
		var _ad = angle_difference(_a,_base_angle)
		if(abs(_ad)>anglet) _a =_base_angle + sign(_ad)*anglet;
		_a = _a - _ad*0.03;
		
		_array[i3  ] = _array[i3-3]+ lengthdir_x(_values[(i<<1)],_a)
		_array[i3+1] = _array[i3-2]+ lengthdir_y(_values[(i<<1)],_a)
		_array[i3+2] = _a
		
		i++
	}
	return _array;
}