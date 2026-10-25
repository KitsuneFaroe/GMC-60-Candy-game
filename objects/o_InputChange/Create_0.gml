input = [function(_input){return false}, 0]

/*
Variables that you need are:
'instance' for the instance storing the input in question.
'name' for the name of the input.
'index' for the index in the input array.
*/

#region This was for testing purposes. ****************************************************************************
/*
input_draw = [function(){}, []]
if(axis == -1){
	input = [input_keyboard, vk_space]
}else{
	input = [input_axis_keyboard, [vk_left, vk_right]]
}
*/
#endregion *****************************************************************************************************

refresh = function(){
	input = instance[$ name][index];
	input_draw = input_get_draw(input)
	input_draw[1] = array_concat([x, y, 1, 1], input_draw[1])
}
refresh()

image_alpha = .25