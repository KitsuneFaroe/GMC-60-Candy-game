//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//uniform vec3 u_radius;
//uniform float u_inten;
uniform float u_rot;
uniform sampler2D u_crackTex;
uniform vec2 u_crackTreshold;

void main()
{
	vec2	vec_center= v_vTexcoord - vec2(0.5,0.5);
	
	float	dis_center=length(vec_center);
	if(dis_center>0.5) discard;
	float	depth= sqrt(0.25-pow(dis_center,2.));
	vec3	normal= vec3(vec_center,depth);
	normal= normalize(normal);
	
	float	u=	atan(normal.z,-normal.x);
	float	v=	acos(-normal.y);
	
	u=	fract(u/(6.28)+u_rot);
	v=	v/(3.14);
	vec4	tex=texture2D( gm_BaseTexture, vec2(u,v))*v_vColour;
	float	crack=texture2D( u_crackTex, vec2(u,v)).r;
	
	float crackval = step(u_crackTreshold.r, crack);
	float crackwhite = smoothstep(u_crackTreshold.g, u_crackTreshold.g+.3, crack);
	
	//vec3	light=	u_radius;
	//float	light_intensity= u_inten;
	//vec3	shaded= vec3(dot(normal,normalize(light)*light_intensity));
	//tex.xyz *= shaded;
	gl_FragColor	= mix(mix(tex, vec4(0.25, 0.15, 0., 1.), crackval), vec4(1.,1.,1.,1.), crackwhite);//vec4(shaded,v_vColour.a);
	
	////gl_FragColor	= vec4(normal.xyz+vec3(0.5), v_vColour.a);
    ////gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
}
