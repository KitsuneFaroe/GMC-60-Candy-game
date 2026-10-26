if(controlable and keyboard_check_pressed(vk_shift)) dash_timer = .3 * game_get_speed(gamespeed_fps)

var angle_mov = - input_axis_check(Input.mov_angle) * controlable
if(angle_mov != 0){
	physics_apply_angular_impulse(angle_mov * 20)
	phy_angular_velocity = clamp(phy_angular_velocity, -rot_max, rot_max)
}

var input_push = input_axis_check(Input.mov_foward) * 16 * controlable * image_xscale

push = (dash_timer>0) ? 100*image_xscale : ( input_push>0 ? input_push : (input_push * 0.4))
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

ds_list_clear(aux_list)
var _radius = sprite_width*1.
var _amount = collision_circle_list(x,y, _radius, o_SugarPart, false, true,aux_list,false)

var i = 0
repeat(_amount){
	
	var _inst = aux_list[| i]
	var _dist = point_distance(x,y,_inst.x, _inst.y)
	if(_inst.dist <_dist){
		_dist = _inst.dist
	}
	_dist -=_radius*.03
	if(_dist <= _radius*.2){
		sugar_add(1)
		instance_destroy(_inst)
	}else{
		_inst.dist = _dist
		var _a = point_direction(x,y,_inst.x, _inst.y)
		_inst.x =x+ lengthdir_x(_dist, _a)
		_inst.y =y+ lengthdir_y(_dist, _a)
	}
	
	i++
}