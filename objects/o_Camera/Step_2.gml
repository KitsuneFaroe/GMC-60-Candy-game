if(keyboard_check_pressed(vk_tab) or keyboard_check_pressed(vk_backspace)) is_rotating = ! is_rotating;

if(follow_player = true and instance_exists(o_Player)){
	var _dist = point_distance(o_Player.phy_position_xprevious,o_Player.phy_position_yprevious, o_Player.phy_position_x,o_Player.phy_position_y)
	var l_dist =height*.4* clamp(unlerp(2,10,_dist),0,1)
	
	
	var x_pos = o_Player.x + lengthdir_x(l_dist, o_Player.phy_rotation)
	var y_pos = o_Player.y + lengthdir_y(l_dist, o_Player.phy_rotation)
	if(is_rotating){
		angle = lerp(angle, o_Player.phy_rotation, .2)
	}else{
		angle = lerp(angle, 90, .2)
	}
	x = lerp(x, x_pos, .1)
	y = lerp(y, y_pos, .1)
	
	
	var zoom_target = .8+ .21* clamp(unlerp(2,10,_dist),0,1)
	
	zoom = lerp(zoom,zoom_target,.2)
	
	if(keyboard_check_pressed(vk_space))
	show_debug_message()
}else{
	zoom = lerp(zoom,1,.1)
	x = lerp(x, x_target, spd)
	y = lerp(y, y_target, spd)
}

