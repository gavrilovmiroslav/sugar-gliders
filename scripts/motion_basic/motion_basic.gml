///motion(rightkey, leftkey, upkey, downkey)
///@description 
///@param rightkey
///@param leftkey
///@param upkey
///@param downkey
function motion_basic(argument0, argument1, argument2, argument3) {

	//////////////////////////////////////
	// CONTROLS //////////////////////////
	//////////////////////////////////////
#region
	//If holding right key////////////////
	if (argument0-argument1 == 1) {
		hsp     = min(maxspd,hsp+accspd);
	}

	//If holding left key/////////////////
	if (argument1-argument0 == 1) {
		hsp     = max(-maxspd,hsp-accspd);
	}

	//If jump key/////////////////////////
	if (argument2 == 1 && !free) {
		vsp		= jmpspd;
		y	   += jmpspd;
		xstretch= .5; 
		ystretch= 2;
	}

	if (argument2 == 1 && free) {
		vsp-= grvspd/2;
	}
#endregion

	//////////////////////////////////////
	// VERTICAL MOVEMENT /////////////////
	//////////////////////////////////////
#region
	free = 1;

	if collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
	
		if vsp > 0 {
		
			part_type_colour1(GAME.ptLooseGroundHigh,floorcolor)
	        part_type_direction(GAME.ptLooseGroundHigh,40,90,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	        part_type_direction(GAME.ptLooseGroundHigh,90,150,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	
			if vsp = vspclamp {
			xstretch = 3 ystretch = .2
			} else {
			xstretch = 2 ystretch = .5
			}
		
		rot = 0;
		drot = 0;
		}
	
		free	= 0;
		vsp		= 0;
	}

	var jtblock = collision_line(x-hw,y+hh,x+hw-1,y+hh,parJt,0,0);
	if (jtblock != noone && jtblock.y <= self.y+hh) {
	
		if vsp > 0 {
		
	        part_type_colour1(GAME.ptLooseGroundHigh,floorcolor)
	        part_type_direction(GAME.ptLooseGroundHigh,40,90,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	        part_type_direction(GAME.ptLooseGroundHigh,90,150,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	
			if vsp = vspclamp {
			xstretch = 3 ystretch = .2
			} else {
			xstretch = 2 ystretch = .5
			}
		
		rot = 0;
		drot = 0;
		}
	
		free	= 0;
		vsp		= 0;
	}

	if (argument3) {
		if jtblock != noone {y += 1}
	}

#endregion

	//////////////////////////////////////
	// FRICTION, GRAVITY, CLAMPING ETC. //
	//////////////////////////////////////
#region
	if (free) {
	        vsp+= grvspd; 
			if (argument1-argument0 == 0) {hsp = max(0,abs(hsp)-airfrc)*sign(hsp);}
			} else {
			if (argument1-argument0 == 0) {hsp = max(0,abs(hsp)-gndfrc)*sign(hsp);}
			}

	hsp = clamp(hsp,-hspclamp,hspclamp);
	vsp = clamp(vsp,-vspclamp,vspclamp);
#endregion

	//////////////////////////////////////
	// MOVEMENT //////////////////////////
	//////////////////////////////////////
#region
	switch (sign(vsp)) {
	    case  1:
	        repeat(abs(vsp)) {
				if !collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
				
					var jtblock = collision_line(x-hw,y+hh,x+hw-1,y+hh,parJt,0,0);
					if !(jtblock != noone && jtblock.y <= self.y+hh) {
							y += sign(vsp)
						}
				} 
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
				} else { if abs(hsp) > 3 && vsp = 0 {xstretch = .4 ystretch = 1.3} hsp = 0;}
			}
	        break;
	    case -1:
	        repeat(abs(hsp)) {
				if !collision_line(x-hw-1,y-hh,x-hw-1,y+hh-1,parSolid,0,0) {
					x += sign(hsp)
				} else { if abs(hsp) > 3 && vsp = 0 {xstretch = .4 ystretch = 1.3} hsp = 0;}
			}
	        break;
	}
#endregion


}
