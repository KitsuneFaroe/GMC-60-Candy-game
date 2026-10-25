if(controlable and keyboard_check_pressed(vk_shift)) dash_timer = .3 * game_get_speed(gamespeed_fps)

var angle_mov = - input_axis_check(Input.mov_angle) * controlable
if(angle_mov != 0){
	physics_apply_angular_impulse(angle_mov * 20)
	phy_angular_velocity = clamp(phy_angular_velocity, -rot_max, rot_max)
}

var input_push = input_axis_check(Input.mov_foward) * 10 * controlable

push = (dash_timer>0) ? dash_timer*13 : ( input_push>0 ? input_push : (input_push * 0.2))
var push_x = lengthdir_x(push, phy_rotation)
var push_y = lengthdir_y(push, phy_rotation)
if(push != 0){
	physics_apply_impulse(phy_position_x, phy_position_y, push_x, push_y)
}
//if(phy_speed > spd_max and dash_timer <= 0){
//	phy_speed_x *= spd_max/phy_speed
//	phy_speed_y *= spd_max/phy_speed
//}


if(dash_timer> 0) dash_timer--
else if (dash_timer = 0) {
	dash_timer--
	phy_speed_x *= .6
	phy_speed_y *= .6
}

if(keyboard_check_pressed(vk_left)){
	egg = 30 + 30
}