#define MAXP 16
attribute vec3 in_Position;      // x = t along curve 0..1, y = s across -0.5..0.5
attribute vec2 in_TextureCoord;
//attribute vec4 in_Colour;
varying vec2 v_vTexcoord;
//varying vec4 v_vColour;

uniform vec2  u_pts[MAXP];       // control points, room coords
uniform float u_n;               // how many are used (>= 2)
uniform float u_width;           // strip width in pixels

void main() {
    float f   = in_Position.x * (u_n - 1.0);
    float seg = min(floor(f), u_n - 2.0);
    float t   = f - seg;

    vec2 p0 = u_pts[int(max(seg - 1.0, 0.0))];
    vec2 p1 = u_pts[int(seg)];
    vec2 p2 = u_pts[int(seg + 1.0)];
    vec2 p3 = u_pts[int(min(seg + 2.0, u_n - 1.0))];

    vec2 a = 2.0*p1;
    vec2 b = p2 - p0;
    vec2 c = 2.0*p0 - 5.0*p1 + 4.0*p2 - p3;
    vec2 d = 3.0*(p1 - p2) + p3 - p0;

    vec2 pos = 0.5 * (a + b*t + c*t*t + d*t*t*t);
    vec2 tan = 0.5 * (b + 2.0*c*t + 3.0*d*t*t);          // derivative
    vec2 nrm = normalize(vec2(-tan.y, tan.x));

    pos += nrm * in_Position.y * u_width;
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(pos, 0.0, 1.0);
    v_vTexcoord = in_TextureCoord;
}