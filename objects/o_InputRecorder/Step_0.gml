//if(){
//	show_debug_message(string(keyboard_key) + ",")
//}

if(not active) return;
var recorded = false
if(keyboard_check_pressed(vk_escape)){
	instance_destroy();
	exit;
}
if(keyboard_check_pressed(vk_anykey) and not array_contains(forbiden_keys, keyboard_key)){
	if(axis == -1){
		struct[$ hash][index] = [input_keyboard, keyboard_key]
	}else{
		var og_input = struct[$ hash][index]
		var _keys = [-1, -1]
		if(og_input[0] == input_axis_keyboard) _keys = og_input[1];
		_keys[axis] = keyboard_key;
		struct[$ hash][index] = [input_axis_keyboard, _keys]
	}
	recorded = true;
}else
if(mouse_check_button_pressed(mb_any)){
	if(axis == -1){
		struct[$ hash][index] = [input_mouse, mouse_button]
	}else{
		if(mouse_button == mb_left){
			struct[$ hash][index] = [input_axis_mouse, [X, 1]]
		}else
		if(mouse_button == mb_right){
			struct[$ hash][index] = [input_axis_mouse, [Y, 1]]
		}else
		if(mouse_button == mb_middle){
			struct[$ hash][index] = [input_axis_mousewheel, 1]
		}
	}
	recorded = true;
}else{
	var _gamepad_pressed = gamepad_button_check_pressed_any_device();
	if(_gamepad_pressed != undefined){
		if(axis == -1){
			struct[$ hash][index] = [input_gamepad, _gamepad_pressed]
		}else{
			var og_input = struct.name[index]
			var _keys = [-1, -1]
			if(og_input[0] == input_axis_gamepad_button) _keys = og_input[1][1];
			_keys[axis] = _gamepad_pressed[1]
			_gamepad_pressed[1] = _keys;
			struct[$ hash][index] = [input_axis_gamepad_button, _gamepad_pressed]
		}
		recorded = true;
	}else
	if(axis != -1){
		_gamepad_pressed = gamepad_axis_check_any_device();
		if(_gamepad_pressed != undefined){
			struct[$ hash][index] = [input_axis_gamepad_stick, _gamepad_pressed]
			recorded = true;
		}
	}
}

if(recorded){ 
	with(o_InputChange) {
		refresh()
	}
	instance_destroy()
}