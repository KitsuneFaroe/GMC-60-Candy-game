function camera_get_normalized(){
	static camera = camera_create_view(0,0,1,1)
	return camera;
}

function show_debug_matrix(mat){
	show_debug_message($" {mat[0]}, {mat[1]}, {mat[2]}, {mat[3]}")
	show_debug_message($" {mat[4]}, {mat[5]}, {mat[6]}, {mat[7]}")
	show_debug_message($" {mat[8]}, {mat[9]}, {mat[10]}, {mat[11]}")
	show_debug_message($" {mat[12]}, {mat[13]}, {mat[14]}, {mat[15]}")
}