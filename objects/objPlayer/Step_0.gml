//If the game is not paused
if GAME.go {
	
//////////////////////////////////////
//FLOORBLOCK//////////////////////////
//////////////////////////////////////
#region
floorblock = collision_line(x-hw,y+hh,x+hw-1,y+hh,parBlock,0,0);
if (floorblock != noone) {
	floorcolor = floorblock.image_blend;
	if (ledgeforgiveness && !free) {
		onfloor = 4;
	}
	
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
			if (!collision_line(x-hw,y-hh-1+jmpspd,x+hw-1,y-hh-1+jmpspd,parSolid,0,0)) && (invincible = 0) {
				vsp = -16;
				y += -1;
				djump = DJA;
				free = 1;
				xstretch= .2; 
				ystretch= 3;
				invincible = 60;
				screenshake(10,8,0);
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
if (onladder = 0 && onrope = 0) {
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
}	

//Water, ladder and rope walk rotation have been condensed into motion script
#endregion	

//////////////////////////////////////
//MOVEMENT////////////////////////////
//////////////////////////////////////
#region
ltimeout	-= 1;	
rtimeout	-= 1; 
bufjump		-= 1;
onfloor		-= 1;
show_debug_message(onfloor)
motion(	keyboard_check(GAME.keyright),
		keyboard_check(GAME.keyleft) ,
		keyboard_check(GAME.keyup)   ,
		keyboard_check(GAME.keydown) ,
		keyboard_check(GAME.keyact1) ,
		keyboard_check_pressed(GAME.keyright),
		keyboard_check_pressed(GAME.keyleft) ,
		keyboard_check_pressed(GAME.keyup)   ,
		keyboard_check_pressed(GAME.keydown) ,
		keyboard_check_pressed(GAME.keyact1) ,
		keyboard_check_pressed(GAME.keyact2) 
		);
		
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
//ANIMATION STATE/////////////////////
//////////////////////////////////////
#region
if (hsp == 0 && vsp == 0) {animstate = 0;}
if (hsp < 0  && vsp == 0) {animstate = 1;}
if (hsp > 0  && vsp == 0) {animstate = 2;}
if (hsp == 0 && vsp != 0) {animstate = 3;}
if (hsp < 0  && vsp != 0) {animstate = 4;}
if (hsp > 0  && vsp != 0) {animstate = 5;}
#endregion

}

