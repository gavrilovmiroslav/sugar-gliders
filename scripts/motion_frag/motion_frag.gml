//////////////////////////////////////
function motion_frag() {
	// FRICTION, GRAVITY, CLAMPING ETC. //
	//////////////////////////////////////
#region

	free = 0;
	if (!collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0)) {
	        vsp+= grvspd; 
			hsp = max(0,abs(hsp)-airfrc)*sign(hsp);
			free = 1;
			} else {
			if (vsp > 18 && bouncy)
				{vsp = -vsp*.5;} else {vsp = 0;}
			hsp = max(0,abs(hsp)-gndfrc)*sign(hsp);
			}

	hsp = clamp(hsp,-hspclamp,hspclamp);
	vsp = clamp(vsp,-vspclamp,vspclamp);
#endregion

	//////////////////////////////////////
	// SHORTCUT //////////////////////////
	//////////////////////////////////////
#region
	if (!collision_line(x,y+1,x+round(hsp),y+round(vsp)+1,parBlock,0,0)) && !collision_rectangle(x-hw+hsp,y-hh+vsp,x+hw+hsp,y+hh+vsp,parSolid,0,0)/*!instance_place(x+round(hsp),y+round(vsp),parBlock)*/{
		x += round(hsp); 
		y += round(vsp);
		return 0;
		}

#endregion

	//////////////////////////////////////
	// MOVEMENT //////////////////////////
	//////////////////////////////////////
#region

	switch (sign(vsp)) {
	    case  1:
	        repeat(abs(vsp)) {
				if !collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
					y += sign(vsp)
				} else {/*vsp = 0;*/}
			}
	        break;
	    case -1:
	        repeat(abs(vsp)) {
				if !collision_line(x-hw,y-hh-1,x+hw-1,y-hh-1,parSolid,0,0) {
					y += sign(vsp)
				} else {vsp = 0;}
			}
	        break;
	}

	switch (sign(hsp)) {
	    case  1:
	        repeat(abs(hsp)) {
				if !collision_line(x+hw,y-hh,x+hw,y+hh-1,parSolid,0,0) {
					x += sign(hsp)
				} else {hsp = 0;}
			}
	        break;
	    case -1:
	        repeat(abs(hsp)) {
				if !collision_line(x-hw-1,y-hh,x-hw-1,y+hh-1,parSolid,0,0) {
					x += sign(hsp)
				} else {hsp = 0;}
			}
	        break;
	}
#endregion


}
