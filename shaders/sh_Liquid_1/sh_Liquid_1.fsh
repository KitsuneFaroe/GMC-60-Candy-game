//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D texLiquid;

void main()
{
	vec4 tex = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	tex = vec4(tex.rgb/tex.a,texture2D( texLiquid, vec2(tex.a, 0.)).a);
	 gl_FragColor = tex;
}
