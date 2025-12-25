if GAME.go {
	if collision_line(x,y-1,x+width-1,y-1,parUnit,1,0) {
		touched = 1;
	}

	if (touched) {
	
		rigidity -= 1;
		if (rigidity <= 0) {
			touched		 = 2;
			vsp			+= 1;
			yadd		+= vsp;
			image_xscale = 0;	//Make the object have no mask
		}
	
		if (rigidity <= respawn) && !collision_rectangle(x,y,x+width,y+height,parUnit,1,0) {
			touched			= 0;
			vsp				= 0;
			yadd			= 0;
			image_xscale	= 1;
			rigidity		= 45;
		}
	
	}
}