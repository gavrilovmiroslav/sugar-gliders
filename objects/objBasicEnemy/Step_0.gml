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
		case c_white:
			//Spikes (replace this code with code for hurting the player)
			if (objPlayer.cheating) break;
			if (!collision_line(x-hw,y-hh-1+jmpspd,x+hw-1,y-hh-1+jmpspd,parSolid,0,0)) {
				vsp = -16;
				y += -1;
				djump = DJA;
				free = 1;
				xstretch= .2;
				ystretch= 3;
				invincible = 60;
				show_debug_message("SPIKE DEATH");
				global.soundDB.PlayRandomSound(global.soundDB.death_sounds);
				room_restart()
			}			

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
//WALKROT/////////////////////////////
//////////////////////////////////////
#region
	if (!free && hsp != 0) {
			walkn += 1;
		
			if (walkn = 3)	{rot = -15;}
			if (walkn = 9)	{rot =  15;}
			if (walkn = 15) {walkn= 0;}
		
		} else if (!free) {
		
			walkn = 0; 
			rot = 0;
		
		} else if (free) {
		
			walkn = 0; 
			rot =  7*sign(hsp);
		
		}	

//Water, ladder and rope walk rotation have been condensed into motion script
#endregion	

//////////////////////////////////////
//MOVEMENT////////////////////////////
//////////////////////////////////////
#region
bufjump		-= 1;
onfloor		-= 1;

motion_simple(	moveright,
				moveleft ,
				moveup   ,
				movedown ,
				moveact,
				moveright,
				moveleft ,
				moveup   ,
				movedown ,
				moveact );
				
	moveleft	= 0;
	moveright	= 0;
	moveup		= 0;
	movedown	= 0;
	moveact		= 0;
				
switch (aidir) {
	
	case 1:
		moveright = 1;
		if !collision_line(x+hw,y+hh,x+hw,y+height,parSolid,1,0) || collision_line(x+hw+1,y+hh-1,x+hw+1,y-hh,parBlock,1,0) {
			aidir = -1;
		}
	break;
	
	case -1:
		moveleft  = 1;
		if !collision_line(x-hw,y+hh,x-hw,y+height,parSolid,1,0) || collision_line(x-hw-1,y+hh-1,x-hw-1,y-hh,parBlock,1,0) {
			aidir = 1;
		}
	break;

}
		
#endregion		

//////////////////////////////////////
//ANIMATION SMOOTHING/////////////////
//////////////////////////////////////
#region
invincible= max(invincible-1,0)
xstretch -= (xstretch-1)*.2;
ystretch -= (ystretch-1)*.2;
drot	 += angle_difference(rot,drot)*.3;
nbob	 += .1;

if (irandom_range(0,120) = 60 && (!blink))
    {blink = 1}
    
if (blink)
    {
        eyeimg += 1;
            if ((eyeimg mod 8) = 0)
                {blink = 0;}
    }

switch (flip) {
    case 1:
        dflip -= (dflip-(pi*.5))*.3;
        break;
    case -1:
        dflip -= (dflip+(pi*.5))*.3;
        break;
}



#endregion

//////////////////////////////////////
//PARTICLE CREATION///////////////////
//////////////////////////////////////
#region
if (hsp != 0 && !free && choose(0,0,0,1)) {
	part_type_colour1(GAME.ptLooseGround,floorcolor);
	part_particles_create(GAME.partSysReg,x+irandom_range(-hw,hw),y+hh,GAME.ptLooseGround,1);
	}
#endregion

}