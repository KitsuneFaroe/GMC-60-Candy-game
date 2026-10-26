//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D texLiquid;

void main()
{
	vec4 tex = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	tex = texture2D( texLiquid, vec2(tex.r, 0.));
	 gl_FragColor = tex;
}
