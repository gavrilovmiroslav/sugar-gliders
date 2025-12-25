//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
size		= 36;						//The size of a 1x1 ladder
xind		= round(x/size);			//Integer value of block position in the world (x)
yind		= round(y/size);			//Integer value of block position in the world (y)
xpos		= ((xind*size)+size*.5);	//Real value of block position in the world (x)
ypos		= ((yind*size)-size*.5);	//Real value of block position in the world (y)

xmin		= round(x/size);							//Minimum integer value position of ladder (x)
ymin		= round((y-(size*(image_yscale-1)))/size);	//Minimum integer value position of ladder (y)

xmax		= round((x+(size*(image_xscale-1)))/size);	//Maximum integer value position of ladder (x)
ymax		= round(y/size);							//Maximum integer value position of ladder (y)

behaviour	= 0;						//Whether to act as a ladder (0) or as a climbable wall (1);