var _async_type = async_load[? "event_type"]
if ( _async_type == "gamepad discovered")
{
    var _pad = async_load[? "pad_index"];
    gamepad_set_axis_deadzone(_pad, 0.2);
    array_push(global.gamepads, _pad);
}
else 
if ( _async_type == "gamepad lost")
{
    var _pad = async_load[? "pad_index"];
    var _index = array_get_index(global.gamepads, _pad);
    array_delete(global.gamepads, _index, 1);
}