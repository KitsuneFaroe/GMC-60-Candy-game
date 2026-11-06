///@desc Autoblink
var _gspeed = game_get_speed(gamespeed_fps)
alarm[5] = irandom_range(6*_gspeed, 18*_gspeed)

var _blink_dur = .5 * _gspeed
if(alarm[6] < _blink_dur)	alarm[6] = _blink_dur