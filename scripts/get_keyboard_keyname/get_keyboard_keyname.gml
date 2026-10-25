function get_keyboard_keyname(_key){
	//key_pairs = {
	//	188 : ",",
	//	190 : ".",
	//	191 : "/",
	//	186 : ";",
	//	222 : "'",
	//	219 : "[",
	//	221 : "]",
	//	189 : "-",
	//	187 : "=",
	//	192 : "`",
	//	111 : "/",
	//	106 : "*",
	//	109 : "-",
	//	107 : "+",
	//	vk_f1: "f1",
	//	vk_f2: "f2",
	//	vk_f3: "f3",
	//	vk_f4: "f4",
	//	vk_f5: "f5",
	//	vk_f6: "f6",
	//	vk_f7: "f7",
	//	vk_f8: "f8",
	//	vk_f9: "f9",
	//	vk_f10: "f10",
	//	vk_f11: "f11",
	//	vk_f12: "f12",
	//	vk_delete: "delete",
	//	vk_insert: "insert",
	//	vk_lcontrol: "L Ctrl",
	//	vk_rcontrol: "R Ctrl",
	//	vk_lalt: "L Alt",
	//	vk_ralt: "R Alt",
	//	vk_lshift: "L Shift",
	//	vk_rshift: "R Shift",
	//	vk_tab: "Tab",
	//	vk_numpad0: "num0",
	//	vk_numpad1: "num1",
	//	vk_numpad2: "num2",
	//	vk_numpad3: "num3",
	//	vk_numpad4: "num4",
	//	vk_numpad5: "num5",
	//	vk_numpad6: "num6",
	//	vk_numpad7: "num7",
	//	vk_numpad8: "num8",
	//	vk_numpad9: "num9",
	//	vk_add: "+",
	//	vk_subtract: "-",
	//	vk_divide: "/",
	//	vk_multiply: "*",
	//	vk_enter: "Enter",
	//	vk_backspace: "backspace",
	//	vk_end: "end",
	//	vk_pageup: "pg up",
	//	vk_pagedown: "pg down",
	//	vk_home: "home",
	//	vk_pause: "pause",
	//	vk_space: "space",
	//	vk_up: "up",
	//	vk_down: "down",
	//	vk_left: "left",
	//	vk_right: "right",
	//	vk_escape: "ecape",
	//	vk_return: "return",
	//	vk_printscreen: "prt sc"
	//}
	var key_pairs = {}
		key_pairs[$ 188 ] =  ",";
		key_pairs[$ 190 ] =  ".";
		key_pairs[$ 191 ] =  "/";
		key_pairs[$ 186 ] =  ";";
		key_pairs[$ 222 ] =  "'";
		key_pairs[$ 219 ] =  "[";
		key_pairs[$ 221 ] =  "]";
		key_pairs[$ 189 ] =  "-";
		key_pairs[$ 187 ] =  "=";
		key_pairs[$ 192 ] =  "`";
		key_pairs[$ 111 ] =  "/";
		key_pairs[$ 106 ] =  "*";
		key_pairs[$ 109 ] =  "-";
		key_pairs[$ 107 ] =  "+";
		key_pairs[$ 220 ] =  "\\";
		key_pairs[$ 144 ] =  "Num Lock";
		key_pairs[$ 20 ] =  "Caps Lock";
		key_pairs[$ 12 ] = "Center"
		key_pairs[$ vk_f1] =  "f1";
		key_pairs[$ vk_f2] =  "f2";
		key_pairs[$ vk_f3] =  "f3";
		key_pairs[$ vk_f4] =  "f4";
		key_pairs[$ vk_f5] =  "f5";
		key_pairs[$ vk_f6] =  "f6";
		key_pairs[$ vk_f7] =  "f7";
		key_pairs[$ vk_f8] =  "f8";
		key_pairs[$ vk_f9] =  "f9";
		key_pairs[$ vk_f10] =  "f10";
		key_pairs[$ vk_f11] =  "f11";
		key_pairs[$ vk_f12] =  "f12";
		key_pairs[$ vk_delete] =  "delete";
		key_pairs[$ vk_insert] =  "insert";
		key_pairs[$ vk_alt] = "Alt";
		key_pairs[$ vk_control] = "Ctrl";
		key_pairs[$ vk_shift] = "Shift";
		key_pairs[$ vk_lcontrol] =  "L Ctrl";
		key_pairs[$ vk_rcontrol] =  "R Ctrl";
		key_pairs[$ vk_lalt] =  "L Alt";
		key_pairs[$ vk_ralt] =  "R Alt";
		key_pairs[$ vk_lshift] =  "L Shift";
		key_pairs[$ vk_rshift] =  "R Shift";
		key_pairs[$ vk_tab] =  "Tab";
		key_pairs[$ vk_numpad0] =  "num0";
		key_pairs[$ vk_numpad1] =  "num1";
		key_pairs[$ vk_numpad2] =  "num2";
		key_pairs[$ vk_numpad3] =  "num3";
		key_pairs[$ vk_numpad4] =  "num4";
		key_pairs[$ vk_numpad5] =  "num5";
		key_pairs[$ vk_numpad6] =  "num6";
		key_pairs[$ vk_numpad7] =  "num7";
		key_pairs[$ vk_numpad8] =  "num8";
		key_pairs[$ vk_numpad9] =  "num9";
		key_pairs[$ vk_add] =  "num +";
		key_pairs[$ vk_subtract] =  "num -";
		key_pairs[$ vk_divide] =  "num /";
		key_pairs[$ vk_multiply] =  "num *";
		key_pairs[$ vk_decimal] = "num .";
		key_pairs[$ vk_enter] =  "Enter";
		key_pairs[$ vk_backspace] =  "backspace";
		key_pairs[$ vk_end] =  "end";
		key_pairs[$ vk_pageup] =  "pg up";
		key_pairs[$ vk_pagedown] =  "pg down";
		key_pairs[$ vk_home] =  "home";
		key_pairs[$ vk_pause] =  "pause";
		key_pairs[$ vk_space] =  "space";
		key_pairs[$ vk_up] =  "up";
		key_pairs[$ vk_down] =  "down";
		key_pairs[$ vk_left] =  "left";
		key_pairs[$ vk_right] =  "right";
		key_pairs[$ vk_escape] =  "esc";
		key_pairs[$ vk_return] =  "Enter";
		key_pairs[$ vk_printscreen] =  "prt sc";
		key_pairs[$ 91] =  "win";
		
	if((_key >= 65 and _key <= 90) or (_key >= 48 and _key <= 57)){
		return chr(_key);
	}
	var _char = key_pairs[$ _key]
	if(_char != undefined){
		return _char
	}else{
		return $"KEY {_key}";
	}
}

