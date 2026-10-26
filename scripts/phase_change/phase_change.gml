function phase_change(level = o_Gobstopper.level){
	o_Player.controlable = false
	o_Camera.ease_to(0.03,o_Gobstopper.x,o_Gobstopper.y)
	o_Gobstopper.alarm[0] = 2 * game_get_speed(gamespeed_fps)
}