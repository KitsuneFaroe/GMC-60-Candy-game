if(cracking) image_index = 3
draw_self()

draw_set_colour(c_red)
draw_set_alpha(.2)

var _x = lengthdir_x(180*image_xscale, -phy_rotation)
var _y = lengthdir_y(180*image_xscale, -phy_rotation)

draw_circle(x+_x, y+_y, 60*image_xscale, false)
draw_circle(x-_x, y-_y, 60*image_yscale, false)

draw_set_colour(c_white)
draw_set_alpha(1)