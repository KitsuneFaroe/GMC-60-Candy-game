var _mouse_met = position_meeting(mouse_x, mouse_y, id)
image_blend = _mouse_met ? c_white : 
((axis == -1) ? 
(input_check([input]) ? c_aqua : c_yellow) :
((((axis-.5) * input_axis_check([input])) > 0) ? c_aqua : c_yellow));

if(mouse_check_button_pressed(mb_any) and not instance_exists(o_InputRecorder) and _mouse_met){
	input_record(instance, name, index, axis);
}