function phase_change(level = o_Gobstopper.level){
	o_Player.controlable = false
	o_Camera.ease_to(2,o_Gobstopper.x,o_Gobstopper.y)
}