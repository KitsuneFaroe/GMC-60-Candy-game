if(alarm[0]>0){
	dist_ = lerp(dist_,dist, 0.1)
	centerx = lerp(centerx,o_Player.x, 0.05)
	centery = lerp(centery,o_Player.y, 0.05)
	
	x = centerx + lengthdir_x(dist_, direction)
	y = centery + lengthdir_y(dist_, direction)
}else{
	x = approach(x, o_Player.x,dist*.1)
	y = approach(y, o_Player.y,dist*.1)
	
	if(point_distance(x,y,o_Player.x,o_Player.y)< (o_Player.sprite_width*0.5)){
		sugar_add(5)
		instance_destroy()
	}
}