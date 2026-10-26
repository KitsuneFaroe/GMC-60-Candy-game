var i = array_length(intro_array);
repeat(i){
	i--
	
	var _number = array_length(intro_array) div 2;
	_number += ceil(i/2) * (((i mod 2) == 0) ? 1 : -1)
	
	var _arc = image_angle + INTRO_ARC_SEP * ((array_length(intro_array)-1)/2 - _number)
	
    var _x = x + lengthdir_x(INTRO_ARC_RAD, 90 + _arc)
	var _y = y + INTRO_ARC_RAD + lengthdir_y(INTRO_ARC_RAD, 90 + _arc)
	
	
	
	var _xscale = image_xscale * animcurve_channel_evaluate(animcurve_get_channel(anim_Intro, 0), intro_timers[_number]/INTRO_BOUNCE_DUR)
	var _yscale = image_yscale * animcurve_channel_evaluate(animcurve_get_channel(anim_Intro, 0), intro_timers[_number]/INTRO_BOUNCE_DUR)
	
	
	if(USE_SEPARATE_AVATARS)
	    draw_sprite_ext(intro_array[_number], 0, _x, _y, _xscale, _yscale, _arc, image_blend, image_alpha)
	else
	    draw_sprite_ext(sprite_index, intro_array[_number], _x, _y, _xscale, _yscale, _arc, image_blend, image_alpha)
}