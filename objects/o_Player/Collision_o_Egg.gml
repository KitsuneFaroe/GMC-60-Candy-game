if(dash_timer < 0) return;

var head_x = x+lengthdir_x(16* image_yscale, phy_rotation)
var head_y = y+lengthdir_y(16* image_yscale, phy_rotation)

var _x = lengthdir_x(180*other.image_xscale, -other.phy_rotation)
var _y = lengthdir_y(180*other.image_xscale, -other.phy_rotation)
var break_radius = 60*other.image_xscale;

var hit = (point_distance(head_x, head_y, other.x+_x, other.y+_y)<=break_radius) - (point_distance(head_x, head_y, other.x-_x, other.y-_y)<=break_radius)

if(hit!= 0){
	if(other.cracking = false){
		dash_timer = 0
		other.cracking = true
		audio_play_sound(sfx_crack2,10,false)
	}else
	with(other){
		
		audio_play_sound(sfx_EggCrack,10,false)
		repeat(40){
			var _rad = 100 * image_xscale * random(1)
			var _a = random(360)
			_x = lengthdir_x(_rad, _a)
			_y = lengthdir_y(_rad, _a)
			var spd = image_xscale*random(1)
			var _scale = random_range(.6,2);
			instance_create_depth(x+_x,y+_y,depth, o_EggLiquid,{
				image_xscale: _scale*image_xscale,
				image_yscale: _scale*image_yscale,
				speed: spd,
				direction: random(360)
			})
		}
		var spd = image_xscale*random(.5)
		instance_create_layer(x+_x,y+_y,"Instances", o_Yolk,{
				image_xscale: image_xscale*.6,
				image_yscale: image_yscale*.6,
				speed: spd,
				direction: random(360),
				f_time: 4
			})
		debris_create(head_x,head_y)
		instance_destroy()
	}
}

//draw_circle(x+_x, y+_y, 15*image_xscale, false)
//draw_circle(x-_x, y-_y, 15*image_yscale, false)