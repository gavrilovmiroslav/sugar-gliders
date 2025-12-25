//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
length = 7;	//Amount of rope pieces to use for the rope (1pc. = 24px)

//////////////////////////////////////
//PHYSICS STUFF///////////////////////
//////////////////////////////////////

//Create a box to attach our rope to
box = physics_fixture_create();
physics_fixture_set_box_shape(box,18,18);
physics_fixture_set_density(box,0);
physics_fixture_bind_ext(box,self,-18,-18);
physics_fixture_delete(box);

//Create the first rope and attach it to our box
idd					= instance_create_depth(x+18,y+36+12,0,objRopePart);
idd.ropegroup		= id;
idd.previousrope	= 0;
physics_joint_revolute_create(self, idd, self.x+18, self.y+36, 0, 0,0,0,0,0,0);
prev				= idd;

//Now attach the rest of the ropes to it one by one
i = 1;
repeat(length-1) {
	idd				= instance_create_depth(x+18,y+36+12+(i*24),0,objRopePart);
	idd.ropegroup	= id;
	physics_joint_revolute_create(prev, idd, self.x+18, self.y+36+(i*24), -45, 45,1,0,0,0,0);
	idd.previousrope= prev;		//These variables keep track of the rope part above and below this one
	prev.nextrope	= idd;		//These variables keep track of the rope part above and below this one
	prev			= idd;
	i			   += 1;
	}