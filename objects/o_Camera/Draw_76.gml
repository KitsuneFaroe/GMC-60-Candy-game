var _width = width * zoom
var _height = height * zoom

var shake_size = width*.005
var _x = x + ((alarm[0]>0)? (-shake_size/2+ shake_size*random(1)) : 0);
var _y = y + ((alarm[0]>0)? (-shake_size/2+ shake_size*random(1)) : 0);

matrix_build_lookat(_x,_y,-dtan(90-fov/2) * _height/2,_x,_y, 0, -lengthdir_x(1, angle), -lengthdir_y(1, angle),0,view_mat)
matrix_build_projection_perspective_fov(fov, _width/_height, 0, 36000, proj_mat_p)
matrix_build_projection_ortho(_width, _height, 0, 36000, proj_mat_o)

camera_set_view_mat(view_camera[0], view_mat)
camera_set_proj_mat(view_camera[0], proj_mat_p)