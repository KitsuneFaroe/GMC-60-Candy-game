// this file is auto generated, do not alter

enum DataPointShapeType {
	point,
	sprite,
	circle,
	box,
	_size
}

gml_pragma("MarkTagAsUsed", "extended_image_sprite");

// returns PointFrame struct
function sprite_get_data_point(_sprite_index, _image_index, _data_point_name) {
    var _sprite_data = __extended_images_data()[$ _sprite_index];
    if (is_undefined(_sprite_data)) {
        return undefined;
    }
    var _point = _sprite_data.points[$ _data_point_name];
    if (is_undefined(_point)) {
        return undefined;
    }
    return _point.frames[$ string(floor(_image_index))];
}

// returns a PointFrames origin x rotated about sprite origin by _image_angle
function sprite_rotate_data_point_x(_data_point, _image_angle) {
    return lengthdir_x(_data_point.x, _image_angle) + lengthdir_x(_data_point.y, _image_angle - 90);
}

// returns a PointFrames origin y rotated about sprite origin by _image_angle
function sprite_rotate_data_point_y(_data_point, _image_angle) {
    return lengthdir_y(_data_point.x, _image_angle) + lengthdir_y(_data_point.y, _image_angle - 90);
}

// returns struct containing all data table props from Sprite Data
function sprite_get_data(_sprite_index) {
    var _sprite_data = __extended_images_data()[$ _sprite_index];
    if (is_undefined(_sprite_data) || !variable_struct_exists(_sprite_data, "data")) {
        return {};
    }
    return _sprite_data.data;
}

function __extended_images_data() {
	static data = (function() {
		var _d = {};
		return _d;
	})();
	return data;
}
