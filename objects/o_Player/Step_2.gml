head_x = x+lengthdir_x(19*image_yscale, phy_rotation)
head_y = y+lengthdir_y(19*image_yscale, phy_rotation)

var _inst = collision_point(head_x, head_y, o_Debris, true, true)

if(_inst != noone and _inst.edible){
	//_inst.image_blend = c_maroon;
	_inst.eat(o_Player)
	
}

tail[0] = x
tail[1] = y
tail[2] = phy_rotation + 180
calculate_tail(tail, tail_values, 20)