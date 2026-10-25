#macro INPUT_CHECK 0
#macro INPUT_PRESSED 1
#macro INPUT_RELEASED 2
#macro X 0
#macro Y 1
#macro WHEEL_UP 0
#macro WHEEL_DOWN 1


gamepads = []

function gamepad_button_check_pressed_any(_device){
	static gamepad_buttons = [
		gp_face1,
		gp_face2,
		gp_face3,
		gp_face4,
		gp_shoulderl,
		gp_shoulderlb,
		gp_shoulderr,
		gp_shoulderrb,
		gp_stickl,
		gp_stickr,
		gp_padl,
		gp_padr,
		gp_padu,
		gp_padd,
		gp_select,
		gp_start,
		gp_home,
		
		gp_touchpadbutton,
		gp_paddlel,
		gp_paddler,
		gp_paddlelb,
		gp_paddlerb,
		gp_extra1,
		gp_extra2,
		gp_extra3,
		gp_extra4,
		gp_extra5,
		gp_extra6
		]
		
	var i = 0;
	repeat(array_length(gamepad_buttons)){
		if(gamepad_button_check_pressed(_device, gamepad_buttons[i])){
			return gamepad_buttons[i];
		}
		i++
	}
	
	return -1
}

function input_record(instance, name, index, axis){
	instance_create_depth(x-100, y-100, depth, o_InputRecorder, {struct: instance, hash: name, index, axis/*(axis ? ((mouse_button == mb_left) ? 0 : 1): -1)*/})
	
}

function gamepad_button_check_pressed_any_device(){
	var i = 0
	var _button = -1
	repeat(array_length(global.gamepads)){
		_button = gamepad_button_check_pressed_any(global.gamepads[i])
		if(_button != -1) return [global.gamepads[i], _button];
		i++
	}
	return undefined;
}
function gamepad_axis_check_any_device(){
	var i = 0
	var _max = 0
	var _axish, _axisv;
	repeat(array_length(global.gamepads)){
		_axish = gamepad_axis_value(global.gamepads[i], gp_axislh)
		_axisv = gamepad_axis_value(global.gamepads[i], gp_axislv)
		_max = max(abs(_axish), abs(_axisv))
		if(_max > 0.25)
		if(abs(_axisv) > abs(_axish)) return [global.gamepads[i], gp_axislv];
		else return [global.gamepads[i], gp_axislh];
		
		_axish = gamepad_axis_value(global.gamepads[i], gp_axisrh)
		_axisv = gamepad_axis_value(global.gamepads[i], gp_axisrv)
		_max = max(abs(_axish), abs(_axisv))
		if(_max > 0.25)
		if(abs(_axisv) > abs(_axish)) return [global.gamepads[i], gp_axisrv];
		else return [global.gamepads[i], gp_axisrh];
		i++
	}
	return undefined;
}


function input_check_pressed(_input){
	gml_pragma("forceinline")
	return input_check(_input, INPUT_PRESSED)
}

function input_check_released(_input){
	gml_pragma("forceinline")
	return input_check(_input, INPUT_RELEASED)
}

function input_check(_input, _type = INPUT_CHECK){
	var i = 0
	repeat(array_length(_input)){
		if(_input[i] == undefined) continue;
		if(_input[i][0](_input[i][1], _type))
			return true;
		i++
	}
	return false;
}

//function input_check(_input, _type){
//	return _input[0](_input[1], _type);
//}

function input_keyboard(_key, _type){
	switch(_type){
		case INPUT_CHECK: return keyboard_check(_key);
		case INPUT_PRESSED: return keyboard_check_pressed(_key);
		case INPUT_RELEASED: return keyboard_check_released(_key);
	}
	return false
}
function input_mouse(_button, _type){
	switch(_type){
		case INPUT_CHECK: return mouse_check_button(_button);
		case INPUT_PRESSED: return mouse_check_button_pressed(_button);
		case INPUT_RELEASED: return mouse_check_button_released(_button);
	}
	return false
}
function input_gamepad(_button, _type){
	switch(_type){
		case INPUT_CHECK: return gamepad_button_check(_button[0],_button[1]);
		case INPUT_PRESSED: return gamepad_button_check_pressed(_button[0],_button[1]);
		case INPUT_RELEASED: return gamepad_button_check_released(_button[0],_button[1]);
	}
	return false
}


function input_axis_check(_input){
	var i = 0
	var _val = 0;
	repeat(array_length(_input)){
		if(_input == undefined) continue;
		_val = _input[i][0](_input[i][1])
		if(_val != 0)
			return _val;
		i++
	}
	return 0;
}

function input_axis_gamepad_stick(_input){
	return gamepad_axis_value(_input[0], _input[1])
}
function input_axis_gamepad_button(_input){
	return (gamepad_button_check(_input[0], _input[1][1]) - gamepad_button_check(_input[0], _input[1][0]));
}
function input_axis_keyboard(_input){
	return (keyboard_check(_input[1]) - keyboard_check(_input[0]));
}
function input_axis_mouse(_input){
	if(_input[0] == Y)
		return window_mouse_get_delta_y()*_input[1];
	else
		return window_mouse_get_delta_x()*_input[1];
}

function input_axis_mouse_button(_input){
	return (mouse_check_button(_input[1]) - mouse_check_button(_input[0]));
}

function input_axis_mousewheel(_input){
	return (mouse_wheel_down() - mouse_wheel_up());
}