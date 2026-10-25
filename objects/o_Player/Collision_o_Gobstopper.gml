switch(other.level){
	case 0:
		if(dash_timer > 0){
			other.hp -= 20
			if(other.hp <= 0){
				phase_change()
			}
			dash_timer = 0
		}
	break;
}