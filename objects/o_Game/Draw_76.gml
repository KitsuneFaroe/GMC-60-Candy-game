var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_set_visible(lay_id, false)

image_blend= layer_background_get_blend(back_id)
image_alpha= layer_background_get_alpha(back_id)