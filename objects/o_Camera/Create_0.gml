view_mat = matrix_build_identity()
proj_mat_p = matrix_build_identity()
proj_mat_o = matrix_build_identity()

width = camera_get_view_width(view_camera[0])
height =camera_get_view_height(view_camera[0])


follow_player = true

x_target = x
y_target = y
angle = 90
is_rotating = true

ease_to = function(val, _x,_y){
	follow_player = false
	x_target = _x
	y_target = _y
	spd = val
}