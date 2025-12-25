if GAME.go {

//////////////////////////////////////
//MOVEMENT////////////////////////////
//////////////////////////////////////
#region
if (active) {
	//Movement
	motion_frag();
	
	//Spinning
	if (spin) {
		image_angle += (abs(hsp)+abs(vsp))*spindir
	}
	
	//If we are on the floor and not moving, mark as inactive
	if (hsp = 0 && vsp = 0 && !free) {
		active = 0;
	}
		
	} else {
	
	//If inactive, stabilize the rotation if applicable
	if (stabilize) {
		image_angle -= (image_angle - (round(image_angle/90)*90))*.1;
		if abs(image_angle - (round(image_angle/90)*90)) < .1 {
			stabilize = 0;
		}
	}
	
	}
#endregion
	
}