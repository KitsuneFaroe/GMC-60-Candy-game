/// @func SpriteRig(root_sprite, scale)
/// @desc Draws several sprites as one rotating puppet. All sprites must share the same canvas
///       size; only their origins differ. `root_sprite`'s origin is the pivot of the whole rig,
///       and each part is placed by (its origin - root origin), so no manual offsets are needed.
///
///       var rig = new SpriteRig(sprHead, 0.5);
///       rig.add("wing", sprWing, true);        // true = also draws a mirrored copy
///       rig.add("head", sprHead);              // draw order = add order
///       rig.part.wing.angle = 10;              // animate each frame...
///       rig.draw(x, y, image_angle + 90);      // ...then draw
///
///       Per-part fields: frame, angle (extra rotation), xs / ys (extra scale).
///       The mirrored copy flips x and takes -angle.
function SpriteRig(_root, _scale = 1) constructor {
	root  = _root;
	scale = _scale;
	part  = {};
	order = [];

	static add = function(_name, _sprite, _mirror = false) {
		var _p = {
			sprite: _sprite, mirror: _mirror,
			ox: sprite_get_xoffset(_sprite) - sprite_get_xoffset(root),
			oy: sprite_get_yoffset(_sprite) - sprite_get_yoffset(root),
			frame: 0, angle: 0, xs: 1, ys: 1,
		};
		part[$ _name] = _p;
		array_push(order, _p);
		return _p;
	}

	/// @arg angle  rig rotation, in draw_sprite_ext's convention
	static draw = function(_x, _y, _angle, _xscale = 1, _yscale = 1, _blend = c_white, _alpha = 1) {
		var _c = dcos(_angle), _s = dsin(_angle);
		var _sx = scale * _xscale, _sy = scale * _yscale;
		for (var i = 0; i < array_length(order); i++) {
			var _p = order[i];
			var _ox = _p.ox * _sx, _oy = _p.oy * _sy;
			draw_sprite_ext(_p.sprite, _p.frame, _x + _ox*_c + _oy*_s, _y - _ox*_s + _oy*_c,
				_sx * _p.xs, _sy * _p.ys, _angle + _p.angle, _blend, _alpha);
			if (_p.mirror) { // reflect the offset across the rig's own vertical axis
				draw_sprite_ext(_p.sprite, _p.frame, _x - _ox*_c + _oy*_s, _y + _ox*_s + _oy*_c,
					-_sx * _p.xs, _sy * _p.ys, _angle - _p.angle, _blend, _alpha);
			}
		}
	}
}
