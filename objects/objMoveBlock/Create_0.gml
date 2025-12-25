//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
hsp			= 0;				//Horizontal moving speed
vsp			= 0;				//Vertical moving speed
width		= (36*image_xscale);//Width of block (in pixels)
height		= (36*image_yscale);//Height of block (in pixels)

list		= ds_list_create(); //List used to keep track of units in contact with self
 