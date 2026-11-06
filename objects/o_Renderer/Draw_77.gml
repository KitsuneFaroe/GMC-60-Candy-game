
//shader_set(sh_BlurFocus)

//shader_set_uniform_f(shader_get_uniform(sh_BlurFocus, "u_focus_pos"))

gpu_set_blendenable(false);
draw_surface(application_surface, 0, 0);
gpu_set_blendenable(true);

//shader_reset()