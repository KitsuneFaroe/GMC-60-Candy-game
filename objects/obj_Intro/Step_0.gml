var i = 0;
repeat(array_length(intro_timers)){
	if(intro_timers[i] > 0 and intro_timers[i] <= INTRO_BOUNCE_DUR) intro_timers[i]++
	i++
}

if((INTRO_DUR - alarm[0]) >= (INTRO_DELAY * intro_number) and intro_number < array_length(intro_array)){
	var _number = array_length(intro_array) div 2;
	_number += ceil(intro_number/2) * (((intro_number mod 2) == 0) ? 1 : -1)
	intro_timers[_number] += 1;
	
	intro_number++
}