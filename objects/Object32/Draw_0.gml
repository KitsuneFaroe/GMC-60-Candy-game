var points = global.Fixture_shapes.egg[0]

var i = 0
repeat(array_length(points)/2){
	draw_circle(x+points[i*2], y+points[i*2+1],4,false)
	draw_text(x+points[i*2]+4, y+points[i*2+1], string(i))
	if(i>0) draw_line(x+points[(i-1)*2], y+points[(i-1)*2+1], x+points[i*2], y+points[i*2+1])
	i++
}