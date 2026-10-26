#macro INTRO_DUR (3 * game_get_speed(gamespeed_fps))
#macro INTRO_BOUNCE_DUR (1 * game_get_speed(gamespeed_fps))
#macro INTRO_DELAY (.33 * game_get_speed(gamespeed_fps))
#macro INTRO_ARC_SEP 30
#macro INTRO_ARC_RAD 640
#macro USE_SEPARATE_AVATARS false

randomize()

intro_number = 0
if(USE_SEPARATE_AVATARS)
    intro_array = [spr_IntroFox, spr_IntroCat, spr_IntroPanda]
else
    intro_array = [0,1,2]
	
intro_timers = array_create(array_length(intro_array), 0)

array_shuffle(intro_array)

alarm[0] = INTRO_DUR