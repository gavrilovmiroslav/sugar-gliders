///motion(rightkey, leftkey, upkey, downkey, actionkey1 , rightkeypress, leftkeypress, upkeypress , downkeypress , actionkey1press)
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
function motion(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

	var rightkey		= argument0,
		leftkey			= argument1,
		upkey			= argument2,
		downkey			= argument3,
		actionkey1		= argument4,
	
		rightkeypress	= argument5,
		leftkeypress	= argument6,
		upkeypress		= argument7,
		downkeypress	= argument8,
		actionkey1press = argument9,
		
		actionkeycheat  = argument10;

	//////////////////////////////////////
	// WATER /////////////////////////////
	//////////////////////////////////////
#region

	if (cheating)
	{
		if (actionkeycheat)
		{
			cheating = false;
		}
		var cheatSpeed = 5;
		if (rightkey)
		{
			x = x + cheatSpeed;
		}
		else if (leftkey)
		{
			x = x - cheatSpeed;
		}
		else if (upkey)
		{
			y = y - cheatSpeed;
		}
		else if (downkey)
		{
			y = y + cheatSpeed;
		}
		return;
	}
	else
	{
		cheating = actionkeycheat;
	}

	if (inwater = 0) && instance_position(x,y+hh-1,objWater) {
		inwater = instance_position(x,y+hh-1,objWater);
		grvspd = .5
	
		var waterbody = inwater;
		var node = round((x-waterbody.x)/waterbody.springsize);
	
		if prevvsp != 0{
			if !inwater.shallows {
			ds_grid_set(waterbody.springgrid,node,1,+3*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node-1,1,+3*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node-2,1,+1.5*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node+1,1,+1.5*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node+2,1,+1.5*sign(-prevvsp))
			ds_grid_set(waterbody.springgrid,node-3,1,+1.5*sign(-prevvsp))
			} else {
			ds_grid_set(waterbody.springgrid,node,1,+2*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node-1,1,+2*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node-2,1,+.5*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node+1,1,+.5*sign(prevvsp))
			ds_grid_set(waterbody.springgrid,node+2,1,+.5*sign(-prevvsp))
			ds_grid_set(waterbody.springgrid,node-3,1,+.5*sign(-prevvsp))
			}
		}
	
		var yy = ds_grid_get(waterbody.springgrid,node,0);
			part_type_colour1(GAME.ptLooseGroundHigh,c_white);
	        part_type_direction(GAME.ptLooseGroundHigh,40,90,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),yy+18,GAME.ptLooseGroundHigh,1);}
	        part_type_direction(GAME.ptLooseGroundHigh,90,150,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),yy+18,GAME.ptLooseGroundHigh,1);}
	
	}

	if (inwater != 0) && !instance_position(x,y+hh-1,objWater) {
	
		var waterbody = inwater;
		var node = round((x-waterbody.x)/waterbody.springsize);
	
		if vsp != 0{
			if !inwater.shallows {
			ds_grid_set(waterbody.springgrid,node,1,+3*sign(vsp))
			ds_grid_set(waterbody.springgrid,node-1,1,+3*sign(vsp))
			ds_grid_set(waterbody.springgrid,node-2,1,+1.5*sign(vsp))
			ds_grid_set(waterbody.springgrid,node+1,1,+1.5*sign(vsp))
			ds_grid_set(waterbody.springgrid,node+2,1,+1.5*sign(-vsp))
			ds_grid_set(waterbody.springgrid,node-3,1,+1.5*sign(-vsp))
			} else {
			ds_grid_set(waterbody.springgrid,node,1,+2*sign(vsp))
			ds_grid_set(waterbody.springgrid,node-1,1,+2*sign(vsp))
			ds_grid_set(waterbody.springgrid,node-2,1,+.5*sign(vsp))
			ds_grid_set(waterbody.springgrid,node+1,1,+.5*sign(vsp))
			ds_grid_set(waterbody.springgrid,node+2,1,+.5*sign(-vsp))
			ds_grid_set(waterbody.springgrid,node-3,1,+.5*sign(-vsp))
			}
		}
	
		var yy = ds_grid_get(waterbody.springgrid,node,0);
			part_type_colour1(GAME.ptLooseGroundHigh,c_white);
	        part_type_direction(GAME.ptLooseGroundHigh,40,90,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),yy-18,GAME.ptLooseGroundHigh,1);}
	        part_type_direction(GAME.ptLooseGroundHigh,90,150,0,0);
	        repeat(3) {part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),yy-18,GAME.ptLooseGroundHigh,1);}
	
		inwater		= 0;
	
		grvspd		= 1;
		airfrc		= iairfrc;
		gndfrc		= igndfrc;
		accspd		= iaccspd;
		maxspd		= imaxspd;
		jmpspd		= ijmpspd;
		vsp			= jmpspd;

	}

	if (inwater) {
	
		if hsp != 0 && inwater.shallows && !free {
		
		
			var waterbody = inwater;
			var node = round((x-waterbody.x)/waterbody.springsize);
			var yy = ds_grid_get(waterbody.springgrid,node,0);
		
			ds_grid_set(waterbody.springgrid,node,1,1)
		
			if (choose(0,0,0,1)) {
			part_type_colour1(GAME.ptLooseGround,c_white);
			part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),yy,GAME.ptLooseGround,1);
			}
		}
			
				if !inwater.shallows{
				free = 0;
			    airfrc		= iairfrc;
				gndfrc		= igndfrc;
				accspd		= iaccspd;
				maxspd		= imaxspd/2;
				jmpspd		= ijmpspd/2;
				vsp = min(4,vsp);}
	}

	prevhsp		= hsp;		
	prevvsp		= vsp;
#endregion

	//////////////////////////////////////
	// LEDGE GRABBING ////////////////////
	//////////////////////////////////////
#region
	if CLG {
		if (vsp >= 0) {
	
			var grabbedledge = collision_line(x+hw,y-hh,x+hw,y-hh-vsp,objLedgeGrabPoint,0,0);
			if grabbedledge = noone {
				grabbedledge = collision_line(x-hw,y-hh,x-hw,y-hh-vsp,objLedgeGrabPoint,0,0)
			}
	
			if (grabbedledge != noone) {
				vsp = 0;
				y = grabbedledge.y+hh;
				if (x < grabbedledge.x) {rot = 15;} else {rot = -15;};
		
				if (upkeypress) {
				vsp = jmpspd;
				xstretch= .5; 
				ystretch= 2;
				vrelease = 0;
				}
		
				if (downkeypress) {
				y += 4;
				}
		
				exit;
			}

		}
	}
#endregion

	//////////////////////////////////////
	// LADDERS ///////////////////////////
	//////////////////////////////////////
#region
	if CCL {

	laddercd -= 1;
	if (laddercd = 0) {
		lastladder = 0;
	}

	if (onladder = 0) && (free) {
	if (collision_line_list(x,y,x+hsp,y+vsp,parLadder,0,0,list,1) != 0) {
		var ladder = ds_list_find_value(list,0);
		ds_list_clear(list);
	
			if ladder != noone && lastladder != ladder && (autoladdergrab || upkey){
				x += hsp;
				y += vsp;
				onladder = ladder;
				hsp = 0;
				vsp = 0;
				ladder.xind = round((objPlayer.x-hw)/36);
				ladder.yind = round((objPlayer.y+hh)/36);
				//Reset movement parameters
			#region
				airfrc		= iairfrc;
				gndfrc		= igndfrc;
				accspd		= iaccspd;
				maxspd		= imaxspd;
				jmpspd		= ijmpspd;
			#endregion
			}

		}
	}

	if onladder != 0 {
	
			var unit = self;
			if ((rightkey-leftkey) == 1) {flip = 1;}			
			if ((leftkey-rightkey) == 1) {flip = -1;}
		
			djump = DJA;	//Reset double jumps
	
			if onladder.behaviour = 1 {
				//Climbable wall disembarking
				if (actionkey1press) {
						lastladder = onladder;
						onladder = 0;
						vsp = jmpspd;
						laddercd = 30;
						xstretch= .5; 
						ystretch= 2;
						vrelease = 0;
				}
			} else if onladder.behaviour = 0 {
				//Ladder disembarking
				if (actionkey1press) {
							while (collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0)) {
								y -= 1;
							}
						hsp = flip*maxspd;
						lastladder = onladder;
						onladder = 0;
						vsp = jmpspd;
						laddercd = 30;
						xstretch= .5; 
						ystretch= 2;
						vrelease = 0;
				}
				else if (y = onladder.ypos) && (onladder.yind <= onladder.ymin) && (!onladder.behaviour) && ((upkey-downkey) == 1) {
						hsp = flip*maxspd;
						lastladder = onladder;
						onladder = 0;
						vsp = jmpspd;
						laddercd = 30;
						xstretch= .5; 
						ystretch= 2;
						vrelease = 0;
							while (collision_line(x-hw,y+hh-1,x+hw-1,y+hh-1,parSolid,0,0)) {
								y -= 1;
							}
						}
				else if (onladder.yind = onladder.ymax) {
				if ((rightkey-leftkey) != 0) {
					lastladder = onladder;
					onladder = 0; 
					laddercd = 10;
					vsp = 0;
					hsp = 0;
					free = 0;
					hsp = flip*maxspd;
						while (collision_line(x-hw,y+hh-1,x+hw-1,y+hh-1,parSolid,0,0)) {
							y -= 1;
						}
					}
				else if (downkey) && !(collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0)){
					lastladder = onladder;
					onladder = 0; 
					laddercd = 30;
					vsp = 0;
					hsp = 0;
					free = 0;
						while (collision_line(x-hw,y+hh-1,x+hw-1,y+hh-1,parSolid,0,0)) {
							y -= 1;
						}
					}
		
				}
		
			}
	
			if onladder != 0 {
			if point_distance(x,y,onladder.xpos,onladder.ypos) > 0 {
				walkn += 1
				if walkn = 2 {rot = -20;}
				if walkn = 6 {rot =  20;}
				if walkn = 10 {walkn= 0;}
			} else { walkn = 0; rot = 0; }
	
			x -= min(ladderspd/(onladder.behaviour+1),abs(x-(onladder.xpos)))*sign(x-(onladder.xpos))
			y -= min(ladderspd/(onladder.behaviour+1),abs(y-(onladder.ypos)))*sign(y-(onladder.ypos))
		
			with(onladder) {
				if (abs(ypos-unit.y) < (unit.ladderspd*2)) && (abs(xpos-unit.x) < (unit.ladderspd*2)) {
					if ((upkey-downkey) == 1) {
						yind -= 1;
					}
				
					if ((downkey-upkey) == 1) {
						yind += 1;
					}
				
					if ((rightkey-leftkey) == 1) {
						xind += 1;
					}
				
					if ((leftkey-rightkey) == 1) {
						xind -= 1;
					}
		
				}
		
			}
		
		with(onladder) {
			xind = clamp(xind,xmin,xmax);
			yind = clamp(yind,ymin,ymax);
			xpos = ((xind*size)+size*.5);
			ypos = ((yind*size)-size*.5);
		}
		}
		exit;
		}

	}
#endregion

	//////////////////////////////////////
	// ROPES /////////////////////////////
	//////////////////////////////////////
#region
	if CGR {
	
	ropecd -= 1;
	if (ropecd = 0) {
		lastrope = 0;
	}

	if (onrope = 0) {
	if (collision_line_list(x,y,x+hsp,y+vsp,objRopePart,0,0,list,1) != 0) {
	
	var rope = ds_list_find_value(list,0);//collision_line(x,y,x+hsp,y+vsp,objRopePart,0,0)
	ds_list_clear(list);

			if rope != noone && lastrope != rope.ropegroup{
				onrope = rope;
				var unit = self;
				//with (objRopePart) {phy_speed_x = 0; phy_speed_y = 0;}
				with(rope) {physics_apply_impulse(x,y,300*sign(unit.hsp),0);}
				with(objRopePart) {if ropegroup=rope.ropegroup {physics_apply_impulse(x,y,50*sign(unit.hsp),0);}}
				hsp = 0;
				vsp = 0;
			#region Reset movement parameters
				airfrc		= iairfrc;
				gndfrc		= igndfrc;
				accspd		= iaccspd;
				maxspd		= imaxspd;
				jmpspd		= ijmpspd;
			#endregion
			}
		}
	}

	if (onrope != 0) {
		x -= (x-(onrope.phy_position_x+lengthdir_x(ropeht,onrope.image_angle-90)))*.7;
		y -= (y-(onrope.phy_position_y+lengthdir_y(ropeht,onrope.image_angle-90)))*.7;
	
		rot = flip*20;
	
		if instance_exists(onrope.nextrope) {ropeht += 8}
		if ropeht >= onrope.seght {
			if onrope.nextrope != 0 {
			ropeht -= onrope.nextrope.seght;//*2
			onrope = onrope.nextrope;
			} else {
			ropeht = 0;//onrope.seght
			}
		}
	
		if onrope.nextrope = 0 {
		onrope = onrope.previousrope;
		ropeht = onrope.seght;
		}
	
		if ((rightkey-leftkey) == 1)  {
		flip	= 1;
		if onrope.phy_speed_y > -1
			{with(onrope) {physics_apply_force(x,y,900,0);}}
		}
	
		if ((leftkey-rightkey) == 1)  {
		flip	=-1;
		if onrope.phy_speed_y > -1
			{with(onrope) {physics_apply_force(x,y,-900,0);}}
		}
	
		if (upkeypress) && !collision_rectangle(x-hw,y-hh,x+hw,y+hh,parSolid,0,0){
			x = round(x);
			y = round(y);
			//hsp = round(onrope.phy_speed_x)*3;
			vsp = jmpspd;
			djump = DJA;
			lastrope	= onrope.ropegroup;
			ropecd		= 30;
			onrope		= 0;
			xstretch= .5; 
			ystretch= 2;
			vrelease = 0;
			}
	
		exit;
		}
	}
#endregion

	//////////////////////////////////////
	// CONTROLS //////////////////////////
	//////////////////////////////////////
#region
	//If holding right key////////////////
	if ((rightkey*(rtimeout < 1))-leftkey == 1)  {
		hsp     = min(maxspd,hsp+accspd);
		flip	= 1;
		}

	//If holding left key/////////////////
	if ((leftkey*(ltimeout < 1))-rightkey == 1)  {
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
		vrelease = 0;
	
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

	//if ((upkey || forceuh > 0) && free) {
	//	vsp-= grvspd/2;
	//	}

	if ((!upkey) && (forceuh <= 0) && (free) && (vsp < 0) && (vrelease = 0)) {
		vsp = (vsp/2);
		vrelease = 1;
	}

	if (!free) {
	
		vrelease = 0; //Implement this in more locations
	
		if (CDJ) {
			djump = DJA;
			}
		}

	if (upkeypress) && (djump != 0) && (free && onfloor < 1) && (!slide) && (!collision_line(x-hw,y-hh-1+jmpspd,x+hw-1,y-hh-1+jmpspd,parSolid,0,0)) {
		vsp		= jmpspd;
		y	   += jmpspd;
		xstretch= .5; 
		ystretch= 2;
		bufjump = 0;
		djump  -= 1;
		vrelease = 0;
	
		part_type_colour1(GAME.ptGeneralPurpose,c_white)
		repeat(6) {part_particles_create(GAME.partSysReg,x+irandom_range(-width,width),y,GAME.ptGeneralPurpose,1)}
		}
#endregion

	//////////////////////////////////////
	// WALLSLIDING ///////////////////////
	//////////////////////////////////////
#region

	slide = 0;

	if CWS {

	var rightblock = collision_line(x+hw,y-hh,x+hw,y+hh-1,parSolid,0,0);
	if (rightblock != noone) && (rightkey) && (free) {
		vsp = min(vsp,2);
		rot = 15;
		if ((upkeypress || bufjump > 0) && CWJ) {
			vsp		= jmpspd;
			hsp		= -maxspd;
			rtimeout= 11;
			xstretch= .5; 
			ystretch= 2;
			bufjump = 0;
			vrelease = 0;
			forceuh = 20;
		}
		slide	= 1;
		flip	= -1;
		if choose(0,0,0,1) {
		part_type_colour1(GAME.ptSlide,rightblock.image_blend);
		part_particles_create(GAME.partSysReg,x+hw,y-hh+random(height),GAME.ptSlide,1);}
	}

	var leftblock = collision_line(x-hw-1,y-hh,x-hw-1,y+hh-1,parSolid,0,0);
	if (leftblock != noone) && (leftkey) && (free) {
		vsp = min(vsp,2);
		rot = -15;
		if ((upkeypress || bufjump > 0) && CWJ) {
			vsp		= jmpspd;
			hsp		= maxspd;
			ltimeout= 11;
			xstretch= .5; 
			ystretch= 2;
			bufjump = 0;
			vrelease = 0;
			forceuh = 20;
		}
		slide	= 1;
		flip	= 1;
		if choose(0,0,0,1) {
		part_type_colour1(GAME.ptSlide,leftblock.image_blend);
		part_particles_create(GAME.partSysReg,x-hw,y-hh+random(height),GAME.ptSlide,1);}
	}

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
	
		vrelease = 0;
		free	= 0;
		vsp		= 0;
	}

	var jtblock = collision_line(x-hw,y+hh,x+hw-1,y+hh,parJt,0,0);
	if (jtblock != noone && jtblock.y >= self.y+hh) {
	
		if vsp > 0 {
		
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
	        vsp += grvspd;
			if (sign(vsp) > 0 && onfloor < 0)
			{
				vsp -= grvspd * min(abs(onfloor) * 0.1, 0.9);
			}
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
					} else {vrelease = 0; free = 0;}
				
				} else {vrelease = 0; free = 0;}
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
