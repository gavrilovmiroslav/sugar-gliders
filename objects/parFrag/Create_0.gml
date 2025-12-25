//////////////////////////////////////
//FRAG LIMIT//////////////////////////
//////////////////////////////////////
if (instance_number(parFrag) > fraglimit) {
	with(instance_find(parFrag,0)) {instance_destroy();}
	}

//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
width			= 16;			//Width of hitbox  (EVEN VALUES ONLY)	
height			= 16;			//Height of hitbox (EVEN VALUES ONLY)
hw				= (width/2);	//Half the hitbox width
hh				= (height/2);	//Half the hitbox height

//If we are in a block, we cannot exist and delete ourselves
if (collision_rectangle(x-hw,y-hh,x+hw,y+hh,parSolid,0,0)) {
	instance_destroy(); 
	exit;
	}

//If we have reached this bit we can exist. Set the rest of the variables.
active			= 1;			//Whether to perform movement code
stabilize		= 1;			//Whether to rotate to a right angle (90° increments)
spin			= 1;			//Whether to spin in the air
spindir			= choose(1,-1);	//What direction to spin in
bouncy			= 1;

grvspd			= 2;			//Vertical speed accelaration (also known as gravity)
airfrc			= .1;			//Friction in the air
gndfrc			= .5;			//Friction on the ground

hsp				= random_range(2,8)*choose(1,-1);	//Initial horizontal speed
vsp				= -random_range(6,18)				//Initial vertical speed
hspclamp		= 24;								//Maximum horizontal speed
vspclamp		= 24;								//Maximum vertical speed

//Visual variables
image_xscale	= 2;
image_yscale	= 2;
image_blend		= choose(c_white32,c_dkwhite32,c_ltgray32,c_gray32,c_dkgray32);

