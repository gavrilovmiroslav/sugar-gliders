image_speed = 0
//////////////////////////////////////
//SETTINGS////////////////////////////
//////////////////////////////////////
//SCE			= true;		//Whether to use [S]hort [C]ircuit [E]valuation when performing movement. This improves performance (especially with many units). 
CWS			= true;		//Whether we [C]an [W]all [S]lide
CWJ			= true;		//Whether we [C]an [W]all [J]ump
CDJ			= true;		//Whether we [C]an [D]ouble [J]ump
DJA			= 0;		//The [D]ouble [J]ump [A]mount, 0 means no double jumps, 1 equals a single double jump, 2 means three jumps etc.
CGR			= true;		//Whether the player [C]an [G]rab [R]opes
CCL			= true;		//Whether the player [C]an [C]limb [L]adders
CLG			= true;		//Whether the player [C]an [L]edge [G]rab

//////////////////////////////////////
//MOVEMENT VARIABLES//////////////////
//////////////////////////////////////
width		= 32;		//Width of hitbox (EVEN VALUES ONLY)
height		= 32;		//Height of hitbox (EVEN VALUES ONLY)
hw			= (width/2);//Half the hitbox width
hh			= (height/2);//Half the hitbox height
h			= 1		     //Horizontal orientation

maxspd		= 5;		//Max horizontal speed
accspd		= 2;		//Movement acceleration speed
jmpspd		=-13;		//Jumping speed
grvspd		= 1;		//Vertical speed accelaration (also known as gravity)
airfrc		= 1;		//Friction (speed that you slow down each frame while not pressing a key) in the air
gndfrc		= 2;		//Friction (speed that you slow down each frame while not pressing a key) on the ground
maxslp		= 1;		//Highest slope you can climb in pixels.

state		= 0;		//Part of the [F]inite [S]tate [M]achine that this engine uses to determine what the player is doing (and what they can do).

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
vrelease	= 0;		//Whether to cut vsp in half as a result of releasing the upkey

slide		= 0;		//Whether the player is sliding down a wall
ltimeout	= 0;		//Lockout left control for a time after walljumping
rtimeout	= 0;		//Lockout right control for a time after walljumping

onrope		= 0;		//Whether we are on a rope
ropeht		= 0;		//Translation while on rope (used for sliding down them)
lastrope	= 0;		//The last rope we touched
ropecd		= 0;		//Cooldown before we can grab the last rope

onladder	= 0;		//Whether we are on a ladder
lastladder	= 0;		//The last ladder we touched
laddercd	= 0;		//Cooldown before we can grab the last ladder
ladderspd	= 8;		//Maximum speed the player can climb on ladders

onledge     = false;    //Whether we are on a ledge

inwater		= 0;		//Whether the player is in water
onslope		= 0;		//Whether the player is on a slope
grabobject  = 0;		//Whether the player has grabbed an object (e.g. a crate)

bufjump		= 0;		//Used for jump input buffering
onfloor     = 0;		//Used for ledge forgiveness
list		= ds_list_create();//List used for various collision checks

animstate	= 0;		//Used to easily get the player's animation state
						// 0 = Idle
						// 1 = Moving left
						// 2 = Moving right
						// 3 = Falling
						// 4 = Moving left in air
						// 5 = moving right in air
						// You can easily add extra animation states by checking variables in the step event
						
water_timer = 0;
water_time_limit = 3;//seconds

//Memory ([i]nitial) variables for different floor types
#region
iairfrc		= airfrc;
igndfrc		= gndfrc;
iaccspd		= accspd;
imaxspd		= maxspd;
ijmpspd		= jmpspd;
#endregion

tail = noone;

//////////////////////////////////////
//VISUAL VARIABLES////////////////////
//////////////////////////////////////
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

ex_mat = 0;

enum states {
	idle,
	wall,
	run,
	fall,
	jump,
	whip
}

ex_state = states.idle