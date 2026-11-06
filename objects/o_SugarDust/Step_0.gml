if(not instance_exists(eater)){
	instance_destroy();
	return;
}

if(alarm[0]>0){
	dist_ = lerp(dist_,dist, 0.1)
	centerx = lerp(centerx,eater.x, 0.08)
	centery = lerp(centery,eater.y, 0.08)
	
	x = centerx + lengthdir_x(dist_, direction)
	y = centery + lengthdir_y(dist_, direction)
}else{
	var _dist = point_distance(eater.x,eater.y, x,y)
	x = approach(x, eater.x,max(_dist*.1, dist*.1))
	y = approach(y, eater.y,max(_dist*.1, dist*.1))
	
	if(point_distance(x,y,eater.x,eater.y)< (eater.sprite_width*0.5)){
		eater.sugar_add(5)
		instance_destroy()
	}
}