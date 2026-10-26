debris_lookup = {}
	debris_lookup[$ s_Egg] = {
		offsets : [276,148, 276,375],
	}
	debris_lookup[$ s_Corn] = {
		offsets : [125,54, 87,130, 164,145, 61,207, 118,266, 205,248]
	}
	debris_lookup[$ s_Rulete] = {
		offsets : [218,57, 73,186, 222,211, 373,152, 130,362, 291,361, 400,274]
	}
	debris_lookup[$ s_Sweet] = {
		offsets : [82,73, 176,69, 79,152, 175, 169]
	}
	debris_lookup[$ s_Stick] = {
		offsets : [84,72, 74,183, 71,276, 135,318, 80,373, 74,468]
	}

function debris_create(x_col=x, y_col=y){
	var _debris = global.debris_lookup[$ sprite_index]
	
	var _ox = sprite_get_xoffset(sprite_index)
	var _oy = sprite_get_yoffset(sprite_index)
	
	var _oangle = point_direction(x_col,y_col,x,y)
	
	var i = 0
	var _offsets = _debris.offsets
	repeat(array_length( _offsets)/2){
		var _veco = rotate_vec(sprite_xoffset, sprite_yoffset, image_angle)
		var _vecd = rotate_vec(_offsets[i*2], _offsets[i*2+1], image_angle)
		var _x = x-_veco[0] + _vecd[0]*image_xscale
		var _y = y-_veco[1] + _vecd[1]*image_yscale
		
		var _push_x = (_x - x_col)/180
		var _push_y = (_y - y_col)/180
		
		var p_angle = -angle_difference(point_direction(x_col, y_col, _x, _y) , _oangle)*0.01;
		instance_create_depth(_x,_y,depth,o_Debris,{
			sprite_index,
			image_index: 1+i,
			image_blend,
			image_angle,
			image_xscale,
			image_yscale,
			hspeed : _push_x,
			vspeed : _push_y,
			rotation : p_angle,
			xoffset : (_ox - _offsets[i*2]  )*image_xscale,
			yoffset : (_oy - _offsets[i*2+1])*image_yscale,
			f_time : 2
		})
		i++
	}
}