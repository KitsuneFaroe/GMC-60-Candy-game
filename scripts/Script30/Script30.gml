/// @function oklch_to_rgb(oklch_array)
/// @description Converts an array [L, C, h] into a normalized [R, G, B] array.
/// @param {Array} L Lightness (0-1), Hue (0-360)
/// @param {real} C Chroma (0-0.4+),
/// @param {real} h Hue (0-360)
/// @return {Array} An array containing [Red (0-1), Green (0-1), Blue (0-1)]

function oklch_to_rgb(L, C, h) {

    // Step 1: Polar (Oklch) to Cartesian (Oklab)
    // GameMaker's dcos and dsin accept degrees directly
    var a = C * dcos(h);
    var b = C * dsin(h);

    // Step 2: Oklab to Non-linear LMS cone space
    var l_nonlinear = L + 0.3963377774 * a + 0.2158037573 * b;
    var m_nonlinear = L - 0.1055613458 * a - 0.0638541728 * b;
    var s_nonlinear = L - 0.0894841775 * a - 1.2914855414 * b;

    // Step 3: Undo cube root (Cube the values)
    var l_linear = l_nonlinear * l_nonlinear * l_nonlinear;
    var m_linear = m_nonlinear * m_nonlinear * m_nonlinear;
    var s_linear = s_nonlinear * s_nonlinear * s_nonlinear;

    // Step 4: Linear LMS to Linear RGB
    var r_linear = +4.0767416621 * l_linear - 3.3077115913 * m_linear + 0.2309699292 * s_linear;
    var g_linear = -1.2684380046 * l_linear + 2.6097574011 * m_linear - 0.3413193965 * s_linear;
    var b_linear = -0.0041960863 * l_linear - 0.7034186147 * m_linear + 1.7076147010 * s_linear;

    // Step 5: Clamp values to valid screen space (0.0 to 1.0)
    r_linear = clamp(r_linear, 0.0, 1.0);
    g_linear = clamp(g_linear, 0.0, 1.0);
    b_linear = clamp(b_linear, 0.0, 1.0);

    // Step 6: Gamma compress to standard sRGB
    var r_srgb = (r_linear <= 0.0031308) ? (r_linear * 12.92) : (1.055 * power(r_linear, 1.0 / 2.4) - 0.055);
    var g_srgb = (g_linear <= 0.0031308) ? (g_linear * 12.92) : (1.055 * power(g_linear, 1.0 / 2.4) - 0.055);
    var b_srgb = (b_linear <= 0.0031308) ? (b_linear * 12.92) : (1.055 * power(b_linear, 1.0 / 2.4) - 0.055);

    // Return as a normalized array [R, G, B]
    return make_colour_rgb(r_srgb*255, g_srgb*255, b_srgb*255);
}
