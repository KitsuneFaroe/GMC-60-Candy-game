if(not surface_exists(egg_surf)){
	var _surf = surface_get_target()
	var _w = surface_get_width(_surf)
	var _h = surface_get_height(_surf)
	egg_surf = surface_create(_w,_h)
}

var _camera = camera_get_active()
surface_set_target(egg_surf)
draw_clear_alpha(c_black,0)
camera_apply(_camera)
//matrix_build(0,0,0,0,0,0,.5, .5,0,mat)
//matrix_set(matrix_world,mat)
with(o_EggLiquid){
	draw_self()
}
surface_reset_target()
matrix_set(matrix_world, mat_identity)