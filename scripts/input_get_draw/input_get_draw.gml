function input_get_draw(_input){
	var _draw = function(_x, _y, _w, _h, str){
		draw_text(_x, _y, str)
	}
	
	if(_input[0] = input_keyboard){
		return [ _draw, [get_keyboard_keyname(_input[1])]]
	}
	if(_input[0] = input_mouse){
		return [ _draw, [ $"mouse {_input[1]}"]]
	}
	if(_input[0] = input_gamepad){
		return [ _draw, [ $"pad{_input[1][0]} {_input[1][1]}"]]
	}
	
	if(_input[0] = input_axis_keyboard){
		//_draw = function(_x, _y, _w, _h, str0, str1){
		//	draw_text(_x, _y, str0)
		//	draw_text(_x, _y + 30, str1)
		//	}
				//return [ _draw, [get_keyboard_keyname(_input[1][0]), get_keyboard_keyname(_input[1][1])]]
		return [ _draw, [get_keyboard_keyname(_input[1][axis])]]
	}
	if(_input[0] = input_axis_mouse){
		return [ _draw, [ $"mouse {(_input[1][0] == Y) ? "Y" : "X"}"]]
	}
	if(_input[0] = input_axis_mouse_button){
		return [ _draw, [ $"mouse {_input[1][axis]}"]]
	}
	if(_input[0] = input_axis_mousewheel){
		return [ _draw, [ $"mousewheel {axis ? "down" : "up"}"]]
	}
	if(_input[0] = input_axis_gamepad_button){
		return [ _draw, [ $"pad{_input[1][0]} {_input[1][1][axis]}"]]
	}
	if(_input[0] = input_axis_gamepad_stick){
		var _stick =
		(_input[1][1] == gp_axislh) ? "lx" : (
		(_input[1][1] == gp_axislv) ? "ly" : (
		(_input[1][1] == gp_axisrh) ? "rx" : (
		(_input[1][1] == gp_axisrv) ? "ry" :
		"wtf")));
		return [ _draw, [ $"pad{_input[1][0]} {_stick} stick"]]
	}
}