if(dash_timer < 0) return;

dash_timer*=.75
with(other){
	repeat(ceil(amount/5)){
	instance_create_layer(x,y,"Fore",o_SugarDust,{
		image_angle : random(360),
		direction : random(360),
		dist : other.sprite_width*.6,
		time : random_range(1.5, 1.6)
	})
	instance_destroy()
	}
}