function calculate_tail(_array, len, anglet){
	var prev_x = _array[0]
	var prev_y = _array[1]
	var prev_a = _array[2]
	var i = 1
	repeat(array_length(_array)/3 -1){
		var i3 = i*3
		var _a = point_direction(_array[i3-3],_array[i3-2], _array[i3], _array[i3+1])
		var _ad = angle_difference(_a,_array[i3-1])
		if(abs(_ad)>anglet) _a =_array[i3-1]+ sign(_ad)*anglet;
		
		_array[i3  ] = _array[i3-3]+ lengthdir_x(len,_a)
		_array[i3+1] = _array[i3-2]+ lengthdir_y(len,_a)
		_array[i3+2] = _a
		
		i++
	}
	return _array;
}