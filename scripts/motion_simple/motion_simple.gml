///motion(rightkey, leftkey, upkey, downkey, actionkey1 , rightkeypress, leftkeypress, upkeypress , downkeypress , actionkey1press )
///@description 
///@param rightkey
///@param leftkey
///@param upkey
///@param downkey
///@param actionkey1
///@param rightkeypress
///@param leftkeypress
///@param upkeypress
///@param downkeypress
///@param actionkey1press
function motion_simple(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	var rightkey		= argument0,
		leftkey			= argument1,
		upkey			= argument2,
		downkey			= argument3,
		actionkey1		= argument4,
	
		rightkeypress	= argument5,
		leftkeypress	= argument6,
		upkeypress		= argument7,
		downkeypress	= argument8,
		actionkey1press = argument9;


	//////////////////////////////////////
	// CONTROLS //////////////////////////
	//////////////////////////////////////
#region
	//If holding right key////////////////
	if ((rightkey-leftkey) == 1)  {
		hsp     = min(maxspd,hsp+accspd);
		flip	= 1;
		}

	//If holding left key/////////////////
	if ((leftkey-rightkey) == 1)  {
		hsp     = max(-maxspd,hsp-accspd);
		flip	= -1;
		}

	//If jump key/////////////////////////
	if jumpinputbuffering && ((upkeypress == 1) && free && djump = 0) {
		bufjump = 6;
		}
	
	if (((upkeypress == 1) || bufjump > 0) && (!free || onfloor > 0)) && (!collision_line(x-hw,y-hh-1+jmpspd,x+hw-1,y-hh-1+jmpspd,parSolid,0,0)) {
		vsp		= jmpspd;
		y	   += jmpspd;
		xstretch= .5; 
		ystretch= 2;
		onfloor = 1;
	
		//If this was a buffered jump, take some extra measures
	#region
		if bufjump > 0 {
			djump = DJA;
			bufjump = 0;
			part_type_colour1(GAME.ptLooseGroundHigh,floorcolor);
			part_type_direction(GAME.ptLooseGroundHigh,40,90,0,0);
			repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
			part_type_direction(GAME.ptLooseGroundHigh,90,150,0,0);
			repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	
			if vsp = vspclamp {
			xstretch = 3; ystretch = .2;
			} else {
			xstretch = 2; ystretch = .5;
			}
			rot		= 0;
			drot	= 0;
		}
	#endregion
		}

	forceuh -= 1;

	if ((upkey || forceuh > 0) && free) {
		vsp-= grvspd/2;
		}

	if (!free && CDJ) {
		djump = DJA;
		}

	if (upkeypress) && (djump != 0) && (free && onfloor < 1) && (!collision_line(x-hw,y-hh-1+jmpspd,x+hw-1,y-hh-1+jmpspd,parSolid,0,0)) {
		vsp		= jmpspd;
		y	   += jmpspd;
		xstretch= .5; 
		ystretch= 2;
		bufjump = 0;
		djump  -= 1;
	
		part_type_colour1(GAME.ptGeneralPurpose,c_white)
		repeat(6) {part_particles_create(GAME.partSysReg,x+irandom_range(-width,width),y,GAME.ptGeneralPurpose,1)}
		}
#endregion

	//////////////////////////////////////
	// VERTICAL MOVEMENT /////////////////
	//////////////////////////////////////
#region
	free = 1;

	if collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
	
		if vsp > 0 {
		
			part_type_colour1(GAME.ptLooseGroundHigh,floorcolor);
	        part_type_direction(GAME.ptLooseGroundHigh,40,90,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	        part_type_direction(GAME.ptLooseGroundHigh,90,150,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	
			if vsp = vspclamp {
			xstretch = 3; ystretch = .2;
			} else {
			xstretch = 2; ystretch = .5;
			}
		
		rot		= 0;
		drot	= 0;
		}
	
		free	= 0;
		vsp		= 0;
	}

	var jtblock = collision_line(x-hw,y+hh,x+hw-1,y+hh,parJt,0,0);
	if (jtblock != noone && jtblock.y >= self.y+hh) {
	
		if vsp > 0 { //ADD AN EXTRA CHECK FOR MOVING PLATFORMS AT 0 VSPD ENTER?
		
	        part_type_colour1(GAME.ptLooseGroundHigh,floorcolor)
	        part_type_direction(GAME.ptLooseGroundHigh,40,90,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	        part_type_direction(GAME.ptLooseGroundHigh,90,150,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+(hh*1.5),GAME.ptLooseGroundHigh,1);}
	
			if vsp = vspclamp {
			xstretch = 3; ystretch = .2;
			} else {
			xstretch = 2; ystretch = .5;
			}
		
		rot		= 0;
		drot	= 0;
		}
	
		if vsp >= 0 {
		free	= 0;
		vsp		= 0;
		}

	}

	if (downkey) {
		if jtblock != noone && !collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {y += 1;}
		//Workaround for vertically moving blocks
		if (forcev > 0) {y += forcev;}
	}

#endregion

	//////////////////////////////////////
	// FRICTION, GRAVITY, CLAMPING ETC. //
	//////////////////////////////////////
#region
	if (free) {
	        vsp+= grvspd; 
			if ((leftkey-rightkey) == 0) {hsp = max(0,abs(hsp)-airfrc)*sign(hsp);}
			} else {
			if ((leftkey-rightkey) == 0) {hsp = max(0,abs(hsp)-gndfrc)*sign(hsp);}
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
		var jtlist, jtblock, jtfree, ilist, iilist;
		jtlist = ds_list_create();
	        repeat(abs(vsp)) {
				if !collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
					/*
					var jtblock = collision_line(x-hw,y+hh,x+hw-1,y+hh,parJt,0,0);
					if !(jtblock != noone && jtblock.y >= self.y+hh) {
							y += sign(vsp)
						}
					*/
				
					ds_list_clear(jtlist);
					jtfree = 1;
					collision_line_list(x-hw,y+hh,x+hw-1,y+hh,parJt,0,0,jtlist,0);
					ilist = 0;
					iilist = ds_list_size(jtlist);
				
					//if iilist > 0 {show_message(iilist)}
				
					while (ilist < iilist) {
					jtblock = ds_list_find_value(jtlist,ilist);
						if (jtblock.y = self.y+hh) {
							//show_message("Not free!")
							jtfree = 0;
						}
					ilist += 1;
					}
				
					if (jtfree = 1) {
						y += sign(vsp);
					}
				
				
				} 
			}
		
			ds_list_destroy(jtlist);
	        break;
	    case -1:
	        repeat(abs(vsp)) {
				if !collision_line(x-hw,y-hh-1,x+hw-1,y-hh-1,parSolid,0,0) {
					y += sign(vsp)
				} else {vsp = 0;}
			}
	        break;
	}

	if slopesenabled {
#region Horizontal movement with slopes

	onslope = collision_line(x-hw,y+hh,x+hw-1,y+hh,objSlope,0,0);

		switch (sign(hsp)) {
	    case  1:
	        repeat(abs(hsp)) {
				var i = 0, col = 1;
				repeat(maxslp+1) {
			
				if !collision_line(x+hw,y-hh-i,x+hw,y+hh-1-i,parSolid,0,0) {
					x += sign(hsp);
					y -= i;
					col = 0;
					break;
				}
			
				i += 1;
				}
			
				if col = 1 {if abs(hsp) > 5 && vsp = 0 {xstretch = .4 ystretch = 1.3} hsp = 0;}
			}
	        break;
	    case -1:
	        repeat(abs(hsp)) {
			
				var i = 0, col = 1;
				repeat(maxslp+1) {
				
				if !collision_line(x-hw-1,y-hh-i,x-hw-1,y+hh-1-i,parSolid,0,0) {
					x += sign(hsp)
					y -= i;
					col = 0;
					break;
				}
			
				i += 1;
				}
			
				if col = 1 {if abs(hsp) > 5 && vsp = 0 {xstretch = .4 ystretch = 1.3} hsp = 0;}
			}
	        break;
	}

	if (onslope != noone) {
		repeat(abs(hsp)*maxslp) {
				
			if !collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
				y += 1;
			}
		}
	}
		
#endregion
	} else {

	switch (sign(hsp)) {
	    case  1:
	        repeat(abs(hsp)) {
				if !collision_line(x+hw,y-hh,x+hw,y+hh-1,parSolid,0,0) {
					x += sign(hsp)
				} else { if abs(hsp) > 5 && vsp = 0 {xstretch = .4 ystretch = 1.3} hsp = 0;}
			}
	        break;
	    case -1:
	        repeat(abs(hsp)) {
				if !collision_line(x-hw-1,y-hh,x-hw-1,y+hh-1,parSolid,0,0) {
					x += sign(hsp)
				} else { if abs(hsp) > 5 && vsp = 0 {xstretch = .4 ystretch = 1.3} hsp = 0;}
			}
	        break;
	}

	}

	//Reset vars keeping track of forced movement
	forceh = 0;
	forcev = 0;
#endregion

	//////////////////////////////////////
	// UNSTUCKING ////////////////////////
	//////////////////////////////////////
#region
	if (unstucking) {
		while collision_rectangle(x-hw,y-hh,x+hw,y+hh,parSolid,0,0) {
		y -= 1;
		}
	}
#endregion


}
