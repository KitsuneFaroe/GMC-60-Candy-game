
gamepad = 0;

mov_x = [
	[input_axis_keyboard, [vk_left, vk_right]],
	[input_axis_keyboard, [vk_numpad4, vk_numpad6]],
	[input_axis_keyboard, [ord("A"), ord("D")]],
	[input_axis_gamepad_button, [gamepad, [gp_padl, gp_padr]]],
	[input_axis_gamepad_stick, [gamepad, gp_axislh]]
]

mov_y = [
	[input_axis_keyboard, [vk_up, vk_down]],
	[input_axis_keyboard, [vk_numpad8, vk_numpad5]],
	[input_axis_keyboard, [ord("W"), ord("S")]],
	[input_axis_gamepad_button, [gamepad, [gp_padu, gp_padd]]],
	[input_axis_gamepad_stick, [gamepad, gp_axislv]]
]

a = [
	[input_keyboard, ord("Z")],
	[input_keyboard, ord("O")],
	[input_mouse, mb_left],
	[input_gamepad, [gamepad, gp_face1]],
]

b = [
	[input_keyboard, ord("X")],
	[input_keyboard, ord("P")],
	[input_mouse, mb_right],
	[input_gamepad, [gamepad, gp_face2]],
]