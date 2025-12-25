//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
hsp			= 0;				//Horizontal moving speed
vsp			= 0;				//Vertical moving speed
width		= (36*image_xscale);//Width of block (in pixels)
height		= (36*image_yscale);//Height of block (in pixels)

list		= ds_list_create(); //List used to keep track of units in contact with self

inst		= 0;				//Which instance to follow
docols		= 1					//Whether to apply hsp and vsp to units in contact

image_blend = c_dkbrown32;		//The color of the crate