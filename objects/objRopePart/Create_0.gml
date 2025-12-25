//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
image_xscale = 1;
image_yscale = 3;

//Create physics object
ropeseg = physics_fixture_create()
physics_fixture_set_box_shape(		ropeseg,4,12);
physics_fixture_set_density(		ropeseg,8)
physics_fixture_set_linear_damping(	ropeseg,.4);
physics_fixture_set_angular_damping(ropeseg,.4);
physics_fixture_bind(				ropeseg,self);
physics_fixture_delete(				ropeseg);

//Keep track of where in the rope we are
ropegroup		= 0;	//What group of ropes we belong to (ID of ropeblock)
nextrope		= 0;	//Rope part below this rope part
previousrope	= 0;	//Rope part above this rope part
seght			= 24;	//Height of rope part (in pixels)