//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
image_xscale	= 2;
image_yscale	= 2
sprite			= texGrass;			//Sprite index to draw
img				= choose(0,1,2,3);	//Image index to draw

width			= 72;			//Width of grass (EVEN VALUES ONLY)
height			= 36;			//Height of grass (EVEN VALUES ONLY)
hw				= (width/2);	//Half the horizontal size of the grass
hh				= (height/2);	//Half the vertical size of the grass

//Used for skewing
hskew = 0;		//X skewing
vskew = 0;		//Y skewing

//Used for scaling
hscale = 0;		//X scaling
vscale = 0;		//Y scaling

//These keep track of the final transformation
hfinal = 0;		//Final horizontal transformation
vfinal = 0;		//Final vertical transformation
dhfinal = 0;	//Final drawn horizontal transformation
dvfinal = 0;	//Final drawn vertical transformation

//Used for sine functions
hn			= random(pi);   //Horizontal sine functions
vn			= random(pi);	//Vertical sine functions
wn			= x/64;			//Used to simulate wind
wobblen		= 0;			//Used for ambient wobble

spawn		= true;			//Whether to spawn a piece of grass behind		