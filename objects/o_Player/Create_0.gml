rot_max = 200
spd_max = 5

dash_timer = 0

size = 1.5

alarm[5] = 10*game_get_speed(gamespeed_fps)

leaf1_a = 0
leaf2_a = 0
leafb_a = 0

head_x = x+lengthdir_x(19*image_yscale, phy_rotation)
head_y = y+lengthdir_y(19*image_yscale, phy_rotation)

aux_list = ds_list_create()

var _tail_resolution = 10;
tail = array_create(_tail_resolution*3,0)
tail_values = array_create(_tail_resolution*2,0)

var i = 0
repeat(array_length(tail)/3){
	tail[i  ]=x+i
	tail[i+1]=y+i
	tail[i+2]=phy_rotation+90
	i+=3
}
i = 0
repeat(array_length(tail_values)/2){
	tail_values[i  ]=sprite_width*.3
	tail_values[i+1]=5
	i+=2
}

sugar_add = function(val){
	sugar+=val
}

sprite_rig = new SpriteRig(s_PlayerHead) 

sprite_rig.add("back", s_PlayerLeafBack,true)
sprite_rig.add("head", s_PlayerHead)
sprite_rig.add("eyes",s_PlayerEyes)
sprite_rig.add("leaf2",s_PlayerLeaf2, true)
sprite_rig.add("leaf1",s_PlayerLeaf1, true)