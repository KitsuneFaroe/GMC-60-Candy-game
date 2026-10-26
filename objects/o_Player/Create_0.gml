rot_max = 200
spd_max = 5

dash_timer = 0

size = 1.5

alarm[5] = 10*game_get_speed(gamespeed_fps)

leaf1_a = 0
leaf2_a = 0
leafb_a = 0

aux_list = ds_list_create()

tail = array_create(10*3,0)

var i = 0
repeat(array_length(tail)/3){
	tail[i  ]=x+i
	tail[i+1]=y+i
	tail[i+2]=phy_rotation+90
	i++
}
