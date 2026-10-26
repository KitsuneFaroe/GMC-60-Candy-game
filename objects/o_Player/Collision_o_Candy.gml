if(dash_timer < 0) return;

var head_x = x+lengthdir_x(16* image_yscale, phy_rotation)
var head_y = y+lengthdir_y(16* image_yscale, phy_rotation)


with(other){
	var _sfx = choose(sfx_crack_small, sfx_crack3, sfx_crack4, sfx_crack5)
	audio_play_sound(_sfx, 10,false,,,random_range(.92,1.5))
	debris_create(head_x,head_y)
	instance_destroy()
}