#region spline init
#macro SEG 48                       // mesh resolution; raise for long or tight curves
vertex_format_begin();
vertex_format_add_position();       // 2D position, used here as (t, s)
vertex_format_add_texcoord();
basic_fmt = vertex_format_end();

//var uv = sprite_get_uvs(spr_strip, 0);   // [left, top, right, bottom, ...]
var vb = vertex_create_buffer();
vertex_begin(vb, basic_fmt);
for (var i = 0; i <= SEG; i++) {
    var t = i / SEG, u = lerp(0, 1, t);
    vertex_position(vb, t, -0.5); vertex_texcoord(vb, u, 0);
    vertex_position(vb, t,  0.5); vertex_texcoord(vb, u, 1);
}
vertex_end(vb);
vertex_freeze(vb);
spline_vb = vb;

//spline_pts = shader_get_uniform(sh_spline, "u_pts");
//spline_n   = shader_get_uniform(sh_spline, "u_n");
//spline_w   = shader_get_uniform(sh_spline, "u_width");

function draw_spline(sprite, subimg, points, width = 1){
	shader_set(sh_spline);
	shader_set_uniform_f_array(shader_get_uniform(sh_spline, "u_pts"), points);
	shader_set_uniform_f(shader_get_uniform(sh_spline, "u_n"), array_length(points) / 2);
	shader_set_uniform_f(shader_get_uniform(sh_spline, "u_width"), sprite_get_height(sprite)*width);
	vertex_submit(global.spline_vb, pr_trianglestrip, sprite_get_texture(sprite, subimg));
	shader_reset();
}