var _camera = camera_get_active()
camera_apply(camera_get_default())

shader_set(sh_Liquid)

texture_set_stage(shader_get_sampler_index(sh_Liquid,"texLiquid"), sprite_get_texture(s_LiquidEgg,0))
//shader_set()
draw_surface_stretched_ext(egg_surf,0,0,room_width,room_height,c_white,1)

shader_reset()
camera_apply(_camera)
