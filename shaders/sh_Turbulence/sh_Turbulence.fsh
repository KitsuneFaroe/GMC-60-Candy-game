//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
//uniform vec2 resolution;

//Number of turbulenec waves
#define TURB_NUM 10.

#define TURB_AMP .9

#define TURB_SPEED .1

#define TURB_FREQ 3.0

#define TURB_EXP 1.7


vec2 turbulence(vec2 pos){
	
	float freq = TURB_FREQ;

	mat2 rot = mat2(0.6, -0.8, 0.8, 0.6);

	for(float i =0.; i<TURB_NUM; i++){
	
		float phase = freq * (pos * rot).y + TURB_SPEED*time + i;
	
		pos += TURB_AMP * rot[0] * sin(phase) / freq;
	
		rot *= mat2(.6, -.8, .8, .6);
	
		freq *= TURB_EXP;
	}
	return pos;
}


void main()
{
	//vec2 p = 2.*(v_vTexcoord*2.-resolution.xy)/resolution.y;
	vec2 p = v_vTexcoord;
	
	p = turbulence(p);
	
	//vec3 col = vec3(p,0.);
	//vec3 col = .5*exp(.1*p.x*vec3(-1,0,2));
	//col /= dot(cos(p*3.),sin(-p.yx*3.*.618))+2.;
	//col = 1. - exp(-col);
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, p);
	//gl_FragColor = vec4(col,1.);
	//gl_FragColor = vec4(fract(p),0.,1.);
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
