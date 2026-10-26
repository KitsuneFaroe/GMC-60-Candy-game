var _width = width * zoom
var _height = height * zoom

_x = x + alarm[0]

matrix_build_lookat(x,y,-dtan(90-fov/2) * _height/2,x,y, 0, -lengthdir_x(1, angle), -lengthdir_y(1, angle),0,view_mat)
matrix_build_projection_perspective_fov(fov, _width/_height, 0, 36000, proj_mat_p)
matrix_build_projection_ortho(_width, _height, 0, 36000, proj_mat_o)

camera_set_view_mat(view_camera[0], view_mat)
camera_set_proj_mat(view_camera[0], proj_mat_p)