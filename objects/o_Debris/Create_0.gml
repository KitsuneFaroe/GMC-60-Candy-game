alarm[0] = f_time * game_get_speed(gamespeed_fps)
image_speed = 0
real_x = x
real_y = y
eater = noone

reload_pos = function(){
	var _vec = rotate_vec(xoffset*image_xscale, yoffset*image_yscale, image_angle)
	x = real_x +_vec[0]
	y = real_y +_vec[1]
}

#macro EAT_TIME (1.5 * game_get_speed(gamespeed_fps))
eat ??= function(_eater){
	instance_create_depth(x,y,depth, o_Eating,{
		sprite_index,
		image_index,
		image_blend,
		image_angle,
		image_xscale,
		image_yscale,
		xoffset,
		yoffset,
		real_x,real_y,
		eater : _eater,
		eating : eating_candy,
		sugar
	})
	instance_destroy()
}

if(init != undefined) init();
if(edible == true){
	edible = false;
	alarm[1] = 2*game_get_speed(gamespeed_fps)
}