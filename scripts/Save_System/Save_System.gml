/*
For saving and loading just use save_set() and save_get(). Check those functions description for more info on how to use them.
Games are automatically loaded from the drive file at the start by calling gamestate_load() on this script.
There is also config_set and config_get if needed to separate settings from the save.
You can make it so the game saves using a secret key just by modifying the macros bellow.
*/

#macro SECRET_KEY "Secret Key"
#macro USE_SECRET_KEY false

function gamestate_save() {
	if(!USE_SECRET_KEY){
		var file = file_text_open_write("save")
		if(file != -1){
			var _string = json_stringify(global.gamestate)
			file_text_write_string(file, _string)
			file_text_close(file)
		}
	}else{
	var file = file_text_open_write("save");
	if (file != -1) {
	    var json_data = json_stringify(global.gamestate);
        
	    // Generar firma de los datos
	    var signature = generate_signature(json_data, SECRET_KEY);
        
	    // Crear objeto con datos + firma
	    var save_object = {
	        data: json_data,
	        signature: signature
	    };
        
	    // Guardar el objeto completo como JSON
	    var save_string = json_stringify(save_object);
	    file_text_write_string(file, save_string);
	    file_text_close(file);
        
	    show_debug_message("Partida guardada con firma de seguridad");
	}
	}
}

function gamestate_load() {
	if(!USE_SECRET_KEY){
		var file = file_text_open_read("save")
		if(file != -1){
			var _string = file_text_read_string(file)
			global.gamestate = json_parse(_string)
			file_text_close(file)
		}
	}else{
	if (!file_exists("save")) {
	    show_debug_message("No hay archivo de guardado");
	    return;
	}
    
	var file = file_text_open_read("save");
	if (file != -1) {
	    var save_string = file_text_read_string(file);
	    file_text_close(file);
        
	    // Intentar parsear como objeto con firma
	    var save_object = json_parse(save_string);
        
	    // Verificar si es el nuevo formato con firma
	    if (is_struct(save_object) && variable_struct_exists(save_object, "data") && variable_struct_exists(save_object, "signature")) {
            
	        // Verificar la firma
	        var json_data = save_object.data;
	        var saved_signature = save_object.signature;
	        var calculated_signature = generate_signature(json_data, SECRET_KEY);
            
	        if (saved_signature == calculated_signature) {
	            // Firma válida - cargar datos
	            global.gamestate = json_parse(json_data);
	            show_debug_message("Partida cargada - verificación de seguridad OK");
	        } else {
	            // Firma inválida
	            show_debug_message("¡ALERTA! Archivo de guardado modificado o corrupto");
	            // Puedes decidir qué hacer aquí: no cargar, cargar con advertencia, etc.
	            // Por ahora no cargamos nada
	            global.gamestate = {} //undefined;
	        }
            
	    } else {
	        // Formato antiguo (sin firma) - cargar directamente por compatibilidad
	        //show_debug_message("Cargando archivo en formato antiguo (sin firma)");
	        //global.gamestate = json_parse(save_string);
			global.gamestate = {}
	    }
	}
	}
}

// Función auxiliar para generar la firma
if(USE_SECRET_KEY){
	function generate_signature(data_string, secret_key) {
		var data_to_hash = data_string + secret_key;
		var buffer = buffer_create(string_length(data_to_hash), buffer_grow, 1);
		buffer_write(buffer, buffer_string, data_to_hash);
		var signature = buffer_md5(buffer, 0, buffer_get_size(buffer));
		buffer_delete(buffer);
		return signature;
	}
}

/**
 * Function Saves a variable into the gamestate on the given key. You can choose whether to update the save on the drive file or not.
 * @param {any*} key The key to store the value to.
 * @param {any*} val Value to set the key to.
 * @param {bool} [save_to_file] Whether to save the gamestate into the drive file or not right now. True by default.
 */
function save_set(_key, _val, _save_to_file = true){
		global.gamestate[$ _key] = _val;
	if (_save_to_file) gamestate_save()
}

/**
 * Function Retrieves a value from the gamestate, you can give a default value if no key was found.
 * @param {any*} key The key to retireve the value from.
 * @param {any*} [default] Value that is returned by default if no key exits. 'undefined' by default.
 */
function save_get(key, def = undefined){
	var _val = struct_get(global.gamestate, key)
	return _val ?? def;
}


function config_load(){
	var file = file_text_open_read("config")
	if(file != -1){
		var _string = file_text_read_string(file)
		global.config = json_parse(_string)
		file_text_close(file)
	}
}
function config_save(){
	var file = file_text_open_write("config")
	if(file != -1){
		var _string = json_stringify(global.config)
		file_text_write_string(file, _string)
		file_text_close(file)
	}
}

function config_set(key, val, _save_to_file = true){
	global.config[$ key] = val;
	//if(key == "music_vol"){
	//	global.music_volume = val
	//	if(audio_exists(global.current_music_id))
	//		audio_sound_gain(global.current_music_id, audio_sound_get_gain(global.current_music)*global.music_volume, 0);
	//}else
	//if(key == "master_vol"){
	//	audio_master_gain(val)
	//	}
	if (_save_to_file) gamestate_save()
}

function config_get(key, def = undefined){
	var _val = struct_get(global.config, key)
	return _val ?? def;
}
global.gamestate = {}
global.config = {}
gamestate_load()
config_load()