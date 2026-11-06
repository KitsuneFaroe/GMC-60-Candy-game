Fixture_shapes = {}

function fixture_create_shape(shape, index, mirror = false, scale_x = 1, scale_y = 1, offset_x = 0, offset_y = 0, angle = 0){
	if(is_string(shape)){
		shape = global.Fixture_shapes[$ shape]
	}
	var _fix = physics_fixture_create()
	physics_fixture_set_polygon_shape(_fix)
	
	var i = 0
	repeat(array_length(shape[index])){
		var _x = (shape[index][i*2]  +offset_y) * scale_x
		var _y = (shape[index][i*2+1]+offset_x) * scale_y
		
		_x = lengthdir_x(_x, angle)
		_y = lengthdir_y(_y, angle+90)
		physics_fixture_add_point(_fix,_x, _y)
		i++
	}
	if(mirror){
	i = array_length(shape[index])-1
	repeat(array_length(shape[index])){
		var _x = -(shape[index][i*2]  +offset_y) * scale_x
		var _y = (shape[index][i*2+1]+offset_x) * scale_y
		if(_x == 0){i--; continue}
		_x = lengthdir_x(_x, angle)
		_y = lengthdir_y(_y, angle+90)
		physics_fixture_add_point(_fix,_x, _y)
		i--
	}
	}
	return _fix;
}