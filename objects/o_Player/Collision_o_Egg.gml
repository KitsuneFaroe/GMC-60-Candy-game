var head_x = lengthdir_x(16* image_yscale, phy_rotation)
var head_y = lengthdir_y(16* image_yscale, phy_rotation)

var _x = lengthdir_x(45*other.image_xscale, -other.phy_rotation)
var _y = lengthdir_y(45*other.image_xscale, -other.phy_rotation)
var break_radius = 15*other.image_xscale;

var hit = (point_distance(head_x, head_y, x+_x, y+_y)<=break_radius) - (point_distance(head_x, head_y, x-_x, y-_y)<=break_radius)

if(hit!= 0){
	fr
}

draw_circle(x+_x, y+_y, 15*image_xscale, false)
draw_circle(x-_x, y-_y, 15*image_yscale, false)