if(alarm[0]<=0){
	
	hspeed = approach(hspeed,0,abs(lengthdir_x(friction,direction)))
	vspeed = approach(vspeed,0,abs(lengthdir_y(friction,direction)))
	rotation = approach(rotation, 0, angular_friction)
}

real_x+=hspeed;
real_y+=vspeed;
image_angle += rotation;

//if(alarm[3])> 0){
	
//}

reload_pos()