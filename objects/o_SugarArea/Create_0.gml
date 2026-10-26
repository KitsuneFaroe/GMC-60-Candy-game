var _a = sprite_width*sprite_height

repeat(_a/density){
	instance_create_depth(
	x + random(sprite_width),
	y + random(sprite_height),
	depth,
	o_SugarPart
	)
}
instance_destroy()