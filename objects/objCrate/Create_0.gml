//////////////////////////////////////
//SETTINGS////////////////////////////
//////////////////////////////////////
//SCE			= true;		//Whether to use [S]hort [C]ircuit [E]valuation when performing movement. This improves performance (especially with many units). 
CDJ			= false;		//Whether we [C]an [D]ouble [J]ump
DJA			= 0;			//The [D]ouble [J]ump [A]mount, 0 means no double jumps, 1 equals a single double jump, 2 means three jumps etc.


//////////////////////////////////////
//MOVEMENT VARIABLES//////////////////
//////////////////////////////////////
width		= 36;		//Width of hitbox (EVEN VALUES ONLY)
height		= 36;		//Height of hitbox (EVEN VALUES ONLY)
hw			= (width/2);//Half the hitbox width
hh			= (height/2);//Half the hitbox height
hit = 0
maxspd		= 0;		//Max horizontal speed
accspd		= 0;		//Movement acceleration speed
jmpspd		= 0;		//Jumping speed
grvspd		= 2;		//Vertical speed accelaration (also known as gravity)
airfrc		= .5;		//Friction (speed that you slow down each frame while not pressing a key) in the air
gndfrc		= 2;		//Friction (speed that you slow down each frame while not pressing a key) on the ground
maxslp		= 1;		//Highest slope you can climb in pixels.
flying		= 0;

vspclamp	= 24;		//Maximum vertical speed
hspclamp	= 24;		//Maximum horizontal speed
forceh		= 0;		//Last hspeed that was forced (by moving platforms, conveyor belts etc...
forcev		= 0;		//Last vspeed that was forced (by moving platforms, conveyor belts etc...

hsp			= 0;		//Horizontal speed
vsp			= 0;		//Vertical speed
prevhsp		= 0;		//Previous hsp
prevvsp		= 0;		//Previous vsp
free		= 0;		//Whether we are in the air
djump		= 0;		//Whether we can double jump
forceuh		= 0;		//Whether to force holding the up key (jump higher)

inwater		= 0;		//Whether the player is in water
onslope		= 0;		//Whether the player is on a slope

bufjump		= 0;		//Used for jump input buffering
onfloor     = 0;		//Used for ledge forgiveness
list = ds_list_create();//List used for various collision checks

//Memory ([i]nitial) variables for different floor types
#region
iairfrc		= airfrc;
igndfrc		= gndfrc;
iaccspd		= accspd;
imaxspd		= maxspd;
ijmpspd		= jmpspd;
#endregion

//////////////////////////////////////
//VISUAL VARIABLES////////////////////
//////////////////////////////////////
image_blend = c_white32;//Color
xstretch	= 1;		//Used for horizontal squishing of the player sprite
ystretch	= 1;		//Used for vertical squishing of the player sprite
rot			= 0;		//Internal player rotation
drot		= 0;		//Drawn player rotation
flip		= 1;		//Visual direction of player (left or right)
dflip		= pi;		//Used for drawn visual direction of player (left or right)
nbob		= 0;		//Used for the bobbing (breathing) animation of the player
eyeimg		= 0;		//What image to use for the players eyes
blink		= 0;		//Whether the player is blinking (whether we should advance eyeimg)

walkn		= 0;		//Used for the walk animation (rocking back and forth while walking)
floorcolor	= 0;		//Color of the block under the player
invincible  = 0;		//Used for invincibility and player visual flashing


//////////////////////////////////////
//CRATE VARIABLES/////////////////////
//////////////////////////////////////
grabbed			= 0;			//Whether the player has grabbed this crate
grabrange		= 64;			//Distance from which this object can be grabbed
xadd			= 0;			//Visual variable for when crate is picked up
xtrans			= 0;			//Translation after pickup
ytrans			= 0;			//Translation after pickup
grabcd			= 0;			//Cooldown before you can throw a crate you grabbed

//Create the collision mask that allows you to stand on the crate
idd				= instance_create_depth(x,y,-1,objCrateCollision);
idd.inst		= self;			//Bind the mask to this object