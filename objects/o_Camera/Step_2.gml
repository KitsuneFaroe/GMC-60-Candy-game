if(follow_player = true and instance_exists(o_Player)){
	var x_pos = o_Player.x
	var y_pos = o_Player.y
	if(is_rotating){
		angle = lerp(angle, o_Player.phy_rotation, .2)
	}else{
		angle = lerp(angle, 90, .2)
	}
	x = lerp(x, x_pos, .1)
	y = lerp(y, y_pos, .1)
}