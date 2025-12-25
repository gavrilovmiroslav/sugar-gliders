if GAME.go {
	
//////////////////////////////////////
//FLOORBLOCK//////////////////////////
//////////////////////////////////////
#region
floorblock = collision_line(x-hw,y+hh,x+hw-1,y+hh,parBlock,0,0);
if (floorblock != noone) {
	floorcolor = floorblock.image_blend;
	if (ledgeforgiveness && !free) {onfloor = 4;}
	
	switch (floorcolor) {
		case 3452415:
			//Spring
			if (!collision_line(x-hw,y-hh-1+jmpspd,x+hw-1,y-hh-1+jmpspd,parSolid,0,0)) {
				vsp = jmpspd*1.5;
				y += jmpspd*1.5;
				djump = DJA;
				free = 1;
				xstretch= .2; 
				ystretch= 3;
				with(floorblock) {xscale = 2;}
			}
		break;
	    case 16050220:
			//Ice
	        airfrc		= iairfrc/5;
			gndfrc		= igndfrc/20;
			accspd		= iaccspd/10;
			maxspd		= imaxspd;
			jmpspd		= ijmpspd;
	        break;
		case 5097059:
			//Slime
	        airfrc		= iairfrc;
			gndfrc		= igndfrc;
			accspd		= iaccspd;
			maxspd		= imaxspd/4;
			jmpspd		= ijmpspd/2;
			break;
	    default:
			//Regular ground
	        airfrc		= iairfrc;
			gndfrc		= igndfrc;
			accspd		= iaccspd;
			maxspd		= imaxspd;
			jmpspd		= ijmpspd;
	        break;
	}
}
#endregion

//////////////////////////////////////
//MOVEMENT////////////////////////////
//////////////////////////////////////
#region
bufjump		-= 1;
onfloor		-= 1;

//Update position of collision mask
#region
with(idd) {
	hsp = -(x-inst.x+inst.hw);
	vsp = -(y-inst.y+inst.hh);
	
		if (docols = 1) {
		//MOVE UNITS STANDING ON CRATE//////////////////////////
		#region
		//Get a list of all units on top of id
		collision_line_list(x,y-1-inst.hh,x+width-1,y-1-inst.hh,parUnit,0,0,list,0);
	
		//If there is anything in this list, have each of them move at the same speed of the platform (if possible)
		if !ds_list_empty(list) {
			var size = ds_list_size(list) , i = 0, vhsp = hsp, vvsp = vsp, me= id;
		
			//Cycle through the list and perform forced movement
			while i < size {
				with (ds_list_find_value(list,i)) {
					#region Perform forced hsp movement
					if (y+hh <= me.y) && (!free){
					
						switch (sign(vhsp)) {

							case  1:
							    repeat(abs(vhsp)) {
									if !collision_line(x+hw,y-hh,x+hw,y+hh-1,parSolid,0,0) {
										x += sign(vhsp);
										forceh = sign(vhsp); //This variable keeps track of the last forced movement
									} 
								}
							    break;
							
							case -1:
							    repeat(abs(vhsp)) {
									if !collision_line(x-hw-1,y-hh,x-hw-1,y+hh-1,parSolid,0,0) {
										x += sign(vhsp);
										forceh = sign(vhsp); //This variable keeps track of the last forced movement
									}
								}
							    break;
							
						}
					
					}
					#endregion			
					#region Perform forced vsp movement
					if (y+hh <= me.y) {
					
						switch (sign(vvsp)) {
						
							case  1:
							    repeat(abs(vvsp)) {
									if !collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
										y += sign(vvsp);
										forcev = sign(vvsp); //This variable keeps track of the last forced movement
									} 
								}
							    break;
							
							case -1:
							    repeat(abs(vvsp)) {
									if !collision_line(x-hw,y-hh-1,x+hw-1,y-hh-1,parSolid,0,0) {
										y += sign(vvsp);
										forcev = sign(vvsp); //This variable keeps track of the last forced movement
									}
								}
							    break;
						}
					
					}
					#endregion
				}
				i += 1;
			}
		
		//We are done, clear the list
		ds_list_clear(list);
		}
		
		#endregion	
		}
		
	x = inst.x-inst.hw;
	y = inst.y-inst.hh;
	}
#endregion

//Handle actual movement
switch (grabbed) {
	
case 0:	//Not grabbed

	motion_simple(	0 ,
					0 ,
					1 ,
					0 ,
					0 ,
					0 ,
					0 ,
					0 ,
					0 ,
					0 );
					
break;

case 1: //Grabbed

	xtrans		-= (xtrans)*.2;
	ytrans		-= (ytrans)*.2;
	xadd		-= (xadd-(objPlayer.flip*24))*.2;
	x			 = objPlayer.x+xadd;
	y			 = objPlayer.y - 30;

break;

}

#endregion	

//////////////////////////////////////
//GRABBED STATE///////////////////////
//////////////////////////////////////
#region
switch (grabbed) { 
	
case 0:
grabcd -= 1;

	if instance_exists(objPlayer) && (grabcd <= 0) {
		if (point_distance(x,y,objPlayer.x,objPlayer.y) < grabrange) && (keyboard_check_pressed(GAME.keyact1)) && (objPlayer.grabobject = 0) {
			
			var nearestcrate = instance_nearest(objPlayer.x,objPlayer.y,objCrate);
			if nearestcrate = id {
				grabbed				= 1;
				idd.docols			= 0;
				idd.image_xscale	= 0;
				objPlayer.grabobject= id;
				xtrans				= (x-(objPlayer.x)-objPlayer.flip*24);
				ytrans				= (y-objPlayer.y);
				xadd				= objPlayer.flip*24;
				x					= objPlayer.x+xadd;
				y					= objPlayer.y;
			}
			
		}
	}


break;

case 1:
	
	if keyboard_check_pressed(GAME.keyact1){
		idd.docols			= 1;
		idd.image_xscale	= 1;
		grabbed				= 0;
		objCrate.grabcd		= 6;
		vsp					= -2;
		hsp					= (32+abs(objPlayer.hsp))*objPlayer.flip;
		objPlayer.grabobject= 0;
		active				= 1;
		xtrans				= 0;
		ytrans				= 0;
		x					= round(x);
		y					= round(y);
		
		//play whine sound
		whine_sound_id = global.soundDB.PlayRandomSound(global.soundDB.whine_sound);
		flying = 1;
	}

	
break;

}
#endregion		

}