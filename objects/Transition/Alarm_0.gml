///transition_room
if(transition_room == room){
	room_restart()	
}else{
	room_goto(transition_room)
}
time = 0
alarm[1]= fadein
in_time = fadein
in_data = data
in_effect = effect