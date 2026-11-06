var _scale = size * sprite_width/sprite_get_width(s_PlayerHead);


//var i = 0
//repeat(array_length(tail)/3){
//	draw_circle(tail[i*3],tail[i*3+1],4,false)
//	i++
//}


var _tail_points = array_clone(tail)
var i = array_length(_tail_points)/3
repeat(i){
	array_delete(_tail_points, i*3-1, 1)
	
	i--
}

//i = 0
//repeat(array_length(_tail_points)/2){
//	draw_circle(_tail_points[i*2],_tail_points[i*2+1],4,false)
//	i++
//}

draw_spline(s_PLayerTail, 0, _tail_points, (0.3*sprite_width*size)/sprite_get_height(s_PLayerTail))




sprite_rig.part.eyes.frame = alarm[6]>0
sprite_rig.part.back.angle = 15+leafb_a*1.5
sprite_rig.part.leaf2.angle = 15+leaf1_a*1.5
sprite_rig.part.leaf1.angle = leaf1_a
sprite_rig.draw(x,y,image_angle, _scale, _scale)


//var _xcenter = sprite_get_xoffset(s_PlayerHead)
//var _vec = rotate_vec(_xcenter, sprite_get_yoffset(s_PlayerHead),image_angle)
//var _ox = x - _vec[0]*_scale
//var _oy = y - _vec[1]*_scale

//_vec = rotate_vec(sprite_get_xoffset(s_PlayerLeafBack), sprite_get_yoffset(s_PlayerLeafBack),image_angle)
//var _x = _ox + _vec[0]*_scale
//var _y = _oy + _vec[1]*_scale
//draw_self_ext(s_PlayerLeafBack,,_x,_y,_scale   ,_scale, image_angle+15+leafb_a*1.5)

//var _offset = sprite_get_xoffset(s_PlayerLeafBack)
//_vec = rotate_vec(_offset+2*(_xcenter-_offset), sprite_get_yoffset(s_PlayerLeafBack),image_angle)
//_x = _ox + _vec[0]*_scale
//_y = _oy + _vec[1]*_scale
//draw_self_ext(s_PlayerLeafBack,,_x,_y,_scale*-1,_scale, image_angle-15-leafb_a*1.5)


//draw_self_ext(s_PlayerHead,,,,_scale,_scale)
//draw_self_ext(s_PlayerEyes,alarm[6]>0,,,_scale,_scale)


////draw_circle(_ox, _oy, 3, false)

//_vec = rotate_vec(sprite_get_xoffset(s_PlayerLeaf2), sprite_get_yoffset(s_PlayerLeaf2),image_angle)
//_x = _ox + _vec[0]*_scale
//_y = _oy + _vec[1]*_scale
//draw_self_ext(s_PlayerLeaf2,,_x,_y,_scale   ,_scale, image_angle+15+leaf1_a*1.5)

//_offset = sprite_get_xoffset(s_PlayerLeaf2)
//_vec = rotate_vec(_offset+2*(_xcenter-_offset), sprite_get_yoffset(s_PlayerLeaf2),image_angle)
//var _x = _ox + _vec[0]*_scale
//var _y = _oy + _vec[1]*_scale
//draw_self_ext(s_PlayerLeaf2,,_x,_y,_scale*-1,_scale, image_angle-15-leaf1_a*1.5)


//_vec = rotate_vec(sprite_get_xoffset(s_PlayerLeaf1), sprite_get_yoffset(s_PlayerLeaf1),image_angle)
//var _x = _ox + _vec[0]*_scale
//var _y = _oy + _vec[1]*_scale
//draw_self_ext(s_PlayerLeaf1,,_x,_y,_scale   ,_scale, image_angle+leaf1_a)

//var _offset = sprite_get_xoffset(s_PlayerLeaf1)
//_vec = rotate_vec(_offset+2*(_xcenter-_offset), sprite_get_yoffset(s_PlayerLeaf1),image_angle)
//var _x = _ox + _vec[0]*_scale
//var _y = _oy + _vec[1]*_scale
//draw_self_ext(s_PlayerLeaf1,,_x,_y,_scale*-1,_scale, image_angle-leaf1_a)



draw_circle(head_x, head_y, 3, false)