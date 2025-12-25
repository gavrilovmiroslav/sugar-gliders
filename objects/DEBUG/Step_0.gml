if keyboard_check_pressed(ord("R")) {game_restart()}
if keyboard_check_pressed(vk_f3) {fulldebug = !fulldebug; image_angle = 90;}

if mouse_check_button(mb_left) && choose(0,0,1) {
	instance_create_depth(mouse_x,mouse_y,-20,objFrag);
}

if mouse_check_button_pressed(mb_right) {
	debugtype += 1;
	if (debugtype = 2) {debugtype = 0;}
}

if mouse_check_button_pressed(mb_middle) {
	CAM.scrshk = 20;
}


//Animation fluff
image_angle -= (image_angle)*.1