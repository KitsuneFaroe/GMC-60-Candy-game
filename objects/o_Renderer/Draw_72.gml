if(keyboard_check_pressed(ord("O"))) add = !add;
if(keyboard_check_pressed(ord("E"))) active = !active;
if(keyboard_check_pressed(ord("M"))) space= !space;
if(keyboard_check_pressed(ord("N"))) space_0= !space_0;
if(keyboard_check_pressed(ord("H"))){
	half= !half;
	surface_free(egg_surf)
}
if(keyboard_check_pressed(vk_add)){
	fade_frame = (fade_frame+1) mod sprite_get_number(Fade_64);
}

var _scalar = 1 - 0.9 * half;
if(not surface_exists(egg_surf)){
	var _surf = surface_get_target()
	var _w = surface_get_width(_surf)*_scalar
	var _h = surface_get_height(_surf)*_scalar
	egg_surf = surface_create(_w,_h, surface_rgba16float)
}

var _camera = camera_get_active()
surface_set_target(egg_surf)
draw_clear_alpha(c_black,0)

camera_apply(_camera)

if(add) gpu_set_blendmode(bm_add)
//gpu_set_blendmode_ext_sepalpha(bm_one, bm_one, bm_one, bm_one);
//gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
gpu_set_blendmode(bm_add)
	
	if(space_0){
		shader_set(sh_Vertex)
	}
	
	with(o_LiquidGroup){
		var _count = physics_particle_group_count(group)
		var _buff = buffer_create(_count, buffer_grow, 4)
		physics_particle_group_get_data(group, _buff, phy_particle_data_flag_position)
		
		
		//buffer_seek(buffer_group, buffer_seek_start, 0)
		buffer_seek(buffer_color, buffer_seek_start, 0)
		repeat(_count){
			var _xx = buffer_read(_buff, buffer_f32)
			var _yy = buffer_read(_buff, buffer_f32)
			var _co = buffer_read(buffer_color, buffer_f32)
			
			draw_sprite_ext(Fade_64,other.fade_frame,_xx, _yy, 1, 1, 0, _co, .5)
		}
		buffer_delete(_buff)
	}
	
	//physics_particle_draw(EGG_LIQUID_FLAGS, EGG_LIQUID_CATEGORY, Sprite18_64, 0)
	
	with(o_EggLiquid){
		draw_self()
	}
	
	shader_reset()
gpu_set_blendmode(bm_normal)
surface_reset_target()

if(keyboard_check_pressed(vk_numpad0)){
	var _def = camera_get_normalized()
	show_debug_message("view")
	debug_matrix(camera_get_view_mat(_def))
	show_debug_message("proj")
	debug_matrix(camera_get_proj_mat(_def))
}