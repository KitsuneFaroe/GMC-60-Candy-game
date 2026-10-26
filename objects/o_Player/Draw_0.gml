var i = 0
repeat(array_length(tail)/3){
	draw_circle(tail[i*3],tail[i*3+1],4,false)
	i++
}


var _scale = size * sprite_width/sprite_get_width(s_PlayerHead);
draw_self_ext(s_PlayerHead,,,,_scale,_scale)
draw_self_ext(s_PlayerEyes,alarm[6]>0,,,_scale,_scale)

var _xcenter = sprite_get_xoffset(s_PlayerHead)
var _vec = rotate_vec(_xcenter, sprite_get_yoffset(s_PlayerHead),image_angle)
var _ox = x - _vec[0]*_scale
var _oy = y - _vec[1]*_scale

//draw_circle(_ox, _oy, 3, false)

_vec = rotate_vec(sprite_get_xoffset(s_PlayerLeaf2), sprite_get_yoffset(s_PlayerLeaf2),image_angle)
_x = _ox + _vec[0]*_scale
_y = _oy + _vec[1]*_scale
draw_self_ext(s_PlayerLeaf2,,_x,_y,_scale   ,_scale, image_angle+15+leaf1_a*1.5)

var _offset = sprite_get_xoffset(s_PlayerLeaf2)
_vec = rotate_vec(_offset+2*(_xcenter-_offset), sprite_get_yoffset(s_PlayerLeaf2),image_angle)
var _x = _ox + _vec[0]*_scale
var _y = _oy + _vec[1]*_scale
draw_self_ext(s_PlayerLeaf2,,_x,_y,_scale*-1,_scale, image_angle-15-leaf1_a*1.5)


_vec = rotate_vec(sprite_get_xoffset(s_PlayerLeaf1), sprite_get_yoffset(s_PlayerLeaf1),image_angle)
var _x = _ox + _vec[0]*_scale
var _y = _oy + _vec[1]*_scale
draw_self_ext(s_PlayerLeaf1,,_x,_y,_scale   ,_scale, image_angle+leaf1_a)

var _offset = sprite_get_xoffset(s_PlayerLeaf1)
_vec = rotate_vec(_offset+2*(_xcenter-_offset), sprite_get_yoffset(s_PlayerLeaf1),image_angle)
var _x = _ox + _vec[0]*_scale
var _y = _oy + _vec[1]*_scale
draw_self_ext(s_PlayerLeaf1,,_x,_y,_scale*-1,_scale, image_angle-leaf1_a)



_x = x+lengthdir_x(16*image_yscale, phy_rotation)
_y = y+lengthdir_y(16*image_yscale, phy_rotation)

//draw_circle(_x, _y, 3, false)