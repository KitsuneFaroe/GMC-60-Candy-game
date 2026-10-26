switch(other.level){
	case 0:
		if(dash_timer > 0){
			audio_play_sound(sfx_Crack1,10,false,,,random_range(1.0,1.5))
			other.hp -= 20
			o_Camera.alarm[0] = .2*game_get_speed(gamespeed_fps)
			if(other.hp <= 0){
				phase_change()
			}
			dash_timer = 0
		}
	break;
	default:
		if(dash_timer > 0){
			audio_play_sound(sfx_Crack1,10,false,,,random_range(1.,1.5))
			other.hp -= 20
			o_Camera.alarm[0] = .2*game_get_speed(gamespeed_fps)
			if(other.hp <= 0){
				phase_change()
			}
			dash_timer = 0
		}
}