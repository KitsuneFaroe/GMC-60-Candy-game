var col_list = ds_list_create()

var origin = instance_place(x,y,o_FixtureOrigin)
var origin_x = origin.x, origin_y = origin.y;
var amount = instance_place_list(x, y, o_FixturePoint, col_list, true)

var _points_struct = {}

var _fix_amount = 0
var i = 0;
repeat(amount){
	var i_point = col_list[| i]
	
	var fix_id = image_blend + real(layer)<<(8*4)
	var _array = _points_struct[$ fix_id]
	if(_array == undefined){
		_array = []
		_points_struct[$ fix_id] = _array
		_fix_amount++
	}
	
	array_push(_array, i_point.x-origin_x, i_point.y-origin_y)
	if(mirror and (i_point.x-origin_x != 0))
	array_push(_array,-i_point.x+origin_x, i_point.y-origin_y)
	
	
	
	i++
}

var _points = array_create(_fix_amount)
var fix_names = struct_get_names(_points_struct)
var i_fix = 0;
repeat(_fix_amount){
	var _fix = _points_struct[$ fix_names[i_fix]]
	
	var _fix_size = array_length(_fix)/2
	var _fix_points = array_create(_fix_size*2)
	_fix_points[0] = _fix[0]
	_fix_points[1] = _fix[1]
	array_delete(_fix, 0, 2)
	var prev_angle;
	i = 0
	repeat(_fix_size-1){
		var higher_index = -1
		var higher_angle = -infinity
		var j=0
		repeat(_fix_size-1-i){
			var _angle = point_direction(_fix_points[i*2], _fix_points[i*2+1], _fix[j*2], _fix[j*2+1])
			_angle = angle_difference(prev_angle, _angle)
			if(_angle > higher_angle){
				higher_angle = _angle
				higher_index = j
				j++
			}
		}
		higher_angle = prev_angle + higher_angle
		if(i > 0) if(angle_difference(prev_angle, higher_angle) <0) throw($"Concave fixture in Area {name}")
		prev_angle = higher_angle
		i++
		_fix_points[i*2]  = _fix[higher_index*2]
		_fix_points[i*2+1]= _fix[higher_index*2+1]
		array_delete(_fix, higher_index*2, 2)
		
	}
	var higher_angle = point_direction(_fix_points[_fix_size*2-2], _fix_points[_fix_size*2-1], _fix_points[0], _fix_points[1])
	if(angle_difference(prev_angle, higher_angle) <0) throw($"Concave fixture in Area {name}")
	
	_points[i_fix] = _fix_points
	
	i_fix++
}
delete _points_struct

array_sort(_points, function(current, next){ return array_length(next) - array_length(current)})

global.Fixture_shapes [$ name] = _points

ds_list_destroy(col_list)

instance_destroy()