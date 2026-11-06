//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


// --- HELPER FUNCTION: Linear RGB to sRGB Gamma Compression ---
vec3 linear_to_srgb(vec3 linearRGB) {
    // Standard sRGB gamma curve formulas
    vec3 cutoff = step(linearRGB, vec3(0.0031308));
    vec3 higher = 1.055 * pow(linearRGB, vec3(1.0 / 2.4)) - 0.055;
    vec3 lower = linearRGB * 12.92;
    
    return mix(higher, lower, cutoff);
}

// --- CORE FUNCTION: Oklch to sRGB ---
// Input: vec3 oklch containing (L, C, h) 
// - L (Lightness): 0.0 to 1.0
// - C (Chroma):    0.0 to ~0.4+
// - h (Hue):       0.0 to 360.0 (in degrees)
// --- HELPER FUNCTION: Linear RGB to sRGB Gamma Compression ---
//vec3 linear_to_srgb(vec3 linearRGB) {
//    // Crucial guard: Force a lower floor of 0.0 to prevent pow() from failing on negative inputs
//    vec3 safeRGB = max(linearRGB, vec3(0.0));

//    vec3 higher = 1.055 * pow(safeRGB, vec3(1.0 / 2.4)) - 0.055;
//    vec3 lower = safeRGB * 12.92;
    
//    vec3 cutoff = step(safeRGB, vec3(0.0031308));
//    return mix(higher, lower, cutoff);
//}

// --- CORE FUNCTION: Oklch to sRGB ---
vec3 oklch_to_rgb(vec3 oklch) {
    float L = oklch.x;
    float C = oklch.y;
    float h = oklch.z;

    // 1. Polar (Oklch) to Cartesian (Oklab)
    float hue_rad = radians(h); 
    float a = C * cos(hue_rad);
    float b = C * sin(hue_rad);

    // 2. Oklab to Non-linear LMS cone space
    // FIXED: Arranged in Column-Major order so that m1 * vec3 works algebraically!
    mat3 m1 = mat3(
        1.0,  1.0,  1.0,             // Column 1
        0.3963377774, -0.1055613458, -0.0894841775, // Column 2
        0.2158037573, -0.0638541728, -1.2914855414  // Column 3
    );
    vec3 lms_nonlinear = m1 * vec3(L, a, b);

    // 3. Undo cube root (Cube the values)
    vec3 lms_linear = lms_nonlinear * lms_nonlinear * lms_nonlinear;

    // 4. Linear LMS to Linear RGB
    // FIXED: Arranged in Column-Major order
    mat3 m2 = mat3(
        +4.0767416621, -1.2684380046, -0.0041960863, // Column 1
        -3.3077115913, +2.6097574011, -0.7034186147, // Column 2
        +0.2309699292, -0.3413193965, +1.7076147010  // Column 3
    );
    vec3 linear_rgb = m2 * lms_linear;

    // 5. Clamp and Gamma compress to standard sRGB
    linear_rgb = clamp(linear_rgb, 0.0, 1.0);
    return linear_to_srgb(linear_rgb);
}


void main()
{
	vec3 lch = vec3(v_vTexcoord.y, v_vColour.r*3., v_vTexcoord.x*360.);
	gl_FragColor = vec4(oklch_to_rgb(lch), v_vColour.a);
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

