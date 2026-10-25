
x += input_axis_check(oldInput.mov_x)*2
y += input_axis_check(oldInput.mov_y)*2

if(input_check(oldInput.a)) pressed = true;
else pressed = false;

if(input_check_pressed(oldInput.b))
toggled = !toggled;