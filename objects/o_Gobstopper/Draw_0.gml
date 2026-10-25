
shader_set(sh_SphereCrack)
shader_set_uniform_f(shader_get_uniform(sh_SphereCrack, "u_rot"), radius/360)
texture_set_stage(shader_get_sampler_index(sh_SphereCrack,"u_crackTex"), sprite_get_texture(s_CracksMerc,0))

var crackval = .2+(hp/100)*.8
var whitecrack = white? 2 : (alarm[0]>=0? ((1-alarm[0]/(2*game_get_speed(gamespeed_fps))) * 1.3) : 0)

shader_set_uniform_f(shader_get_uniform(sh_SphereCrack, "u_crackTreshold"), crackval, 1-whitecrack)
draw_self()

shader_reset()