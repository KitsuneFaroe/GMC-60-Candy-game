switch(other.level){
	case 0:
		if(dash_timer > 0){
			other.hp -= 20
			o_Camera.alarm[0] = .15*game_get_speed(gamespeed_fps)
			if(other.hp <= 0){
				phase_change()
			}
			dash_timer = 0
		}
	break;
	default:
		if(dash_timer > 0){
			other.hp -= 20
			o_Camera.alarm[0] = .15*game_get_speed(gamespeed_fps)
			if(other.hp <= 0){
				phase_change()
			}
			dash_timer = 0
		}
}