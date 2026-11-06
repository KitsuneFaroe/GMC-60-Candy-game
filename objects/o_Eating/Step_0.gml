var _frac = (1-alarm[0]/duration)

if(instance_exists(eater)){
	var _ex = eater[$ "head_x"] ?? eater.x
	var _ey = eater[$ "head_y"] ?? eater.y
	var _dist = point_distance(real_x,real_y,_ex,_ey)
	var _angle = point_direction(_ex, _ey,real_x,real_y)
	if(dist < _dist) _dist = dist ;
	_dist *= (1 - 0.04)
	dist = _dist
	real_x = _ex + lengthdir_x(_dist, _angle)
	real_y = _ey + lengthdir_y(_dist, _angle)
}

eating()

var _val = 1/alarm[0]
_val = lerp(_val, _val*_val, .5)
image_xscale = image_xscale*(1-_val)
image_yscale = image_xscale*(1-_val)

/*
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