/// @desc  Transitions from the current room into another using a visual effect. Returns wheter the transition could happen or not (i.e another transition was already undergoing).
/// @param {asset.gmroom} room  Room to transition into.
/// @param {real} [time]=Transition.def_fadeout  Transition.def_fadeout  Time in steps to fade out of the current room. 30 by default.
/// @param {function} [func]  Method(data) to call when initializing the other room. Uses data as first argument.
/// @param {struct} [data]  Struct containing data for the transition, used for the function called at the start of the next room and the visuals of the transition.
/// @param {real} [fadein]=Transition.def_fadein  Transition.def_fadein  Time in steps to fade into the next room. 20 by dfault.
/// @param {function} [effect]=Transition.def_effect  Transition.def_effect  Method(val, data) for drawing the transition visuals. Uses a value from 0 to 1 in the fade out and a value from 1 to 2 in the fade in. Can also use the data struct. Uses a black fade by default.
/// @returns {bool}  Description
function room_transition(_room, _time = Transition.def_fadeout, _func = undefined, _data = undefined, _fadein = Transition.def_fadein, _effect = Transition.def_effect){
	if(Transition.alarm[0]<=0){
		Transition.transition_room = _room
		Transition.time = _time
		Transition.func = _func 
		Transition.data = _data
		Transition.fadein = _fadein
		Transition.effect = _effect
		Transition.alarm[0] = _time
		return true
	}else return false
}

function black_fade_transition(_val, _data){
	_val = (_val > 1) ? (2 - _val) : _val
	
	var old_col= draw_get_color()
	var old_a = draw_get_alpha()
	
	draw_set_color(c_black)
	draw_set_alpha(_val)
	
	draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),false)

	draw_set_color(old_col)
	draw_set_alpha(old_a)
}

function white_fade_transition(_val, _data){
	_val = (_val > 1) ? (2 - _val) : _val
	
	var old_col= draw_get_color()
	var old_a = draw_get_alpha()
	
	draw_set_color(c_white)
	draw_set_alpha(_val)
	
	draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),false)

	draw_set_color(old_col)
	draw_set_alpha(old_a)
}