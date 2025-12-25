//////////////////////////////////////
//ENGINE SETTINGS/////////////////////
//////////////////////////////////////
//Settings
#macro ledgeforgiveness		true		//Ledge forgiveness
#macro jumpinputbuffering	true		//Jump input buffering
#macro physicsenabled		true		//MUST be enabled if using ropes (disable for performance boost)
#macro slopesenabled		true		//Whether we can traverse slopes. This has a major performance impact.
#macro autoladdergrab		true		//Whether to automatically grab ladders when touching them (use up arrow press otherwise)
#macro stickyladders		false		//Whether ladders can be let go by simply holding a directional key
#macro unstucking			false		//Whether to run the code to unstuck the player if that ever happens. This has a major performance impact.
#macro fraglimit			32			//Maximum number of frag objects active

//General
#macro mat_ident			matrix_build_identity()

//Colors (ENDESGA32 palette)
#macro c_black32			make_colour_rgb(24,20,37)
#macro c_dkgray32			make_colour_rgb(38,43,68)
#macro c_gray32				make_colour_rgb(58,68,102)
#macro c_ltgray32			make_colour_rgb(89,104,134)

#macro c_ltwhite32			make_colour_rgb(255,255,255)
#macro c_white32			make_colour_rgb(192,204,220)
#macro c_dkwhite32			make_colour_rgb(140,155,179)

#macro c_ltgreen32			make_colour_rgb(99,198,77)
#macro c_green32			make_colour_rgb(61,137,71)
#macro c_dkgreen32			make_colour_rgb(38,92,66)

#macro c_ltblue32			make_colour_rgb(44,232,244)
#macro c_blue32				make_colour_rgb(0,149,233)
#macro c_dkblue32			make_colour_rgb(18,79,136)

#macro c_yellow32			make_colour_rgb(255,173,52)
#macro c_dkbrown32			make_colour_rgb(63,40,50)

//////////////////////////////////////
//CONTROLS////////////////////////////
//////////////////////////////////////
keyleft		= vk_left;
keyright	= vk_right;
keydown		= vk_down;
keyup		= vk_up;

keyact1		= ord("X");
keyact2		= ord("C");

go			= 1;

//////////////////////////////////////
//PHYSICS WORLD///////////////////////
//////////////////////////////////////
if (physicsenabled) {
	physics_world_create(1/16);
	physics_world_gravity(0,96);
	}

//////////////////////////////////////
// PARTICLES /////////////////////////
//////////////////////////////////////
partSysBack	 = part_system_create();
partSysReg	 = part_system_create();
partSysFront = part_system_create();

part_system_automatic_update(	partSysBack,false);
part_system_automatic_draw(		partSysBack,false);

part_system_automatic_update(	partSysReg,false);
part_system_automatic_draw(		partSysReg,false);

part_system_automatic_update(	partSysFront,false);
part_system_automatic_draw(		partSysFront,false);

//Particles/////////////////////////////////
//General purpose
ptGeneralPurpose = part_type_create()
part_type_sprite(		ptGeneralPurpose,maskPart,0,0,0)
part_type_colour1(		ptGeneralPurpose,c_red)
part_type_alpha3(		ptGeneralPurpose,1,3,0)
part_type_speed(		ptGeneralPurpose,2,3,-.25,0);
part_type_direction(	ptGeneralPurpose,0,359,0,0);
part_type_orientation(	ptGeneralPurpose,0,359,3,0,0)
part_type_life(			ptGeneralPurpose,10,30);
part_type_size(			ptGeneralPurpose,1.0,2.0,-.1,0)

//Loose ground
ptLooseGround = part_type_create()
part_type_sprite(		ptLooseGround,maskPart,0,0,0);
part_type_colour1(		ptLooseGround,c_red);
part_type_alpha3(		ptLooseGround,1,3,0);
part_type_speed(		ptLooseGround,3,4,-.1,0);
part_type_direction(	ptLooseGround,30,150,0,0);
part_type_orientation(	ptLooseGround,0,359,3,0,0);
part_type_gravity(		ptLooseGround,.30,270);
part_type_life(			ptLooseGround,10,20);
part_type_size(			ptLooseGround,.5,1,-.02,0);

//Loose ground high
ptLooseGroundHigh = part_type_create()
part_type_sprite(		ptLooseGroundHigh,maskPart,0,0,0);
part_type_colour1(		ptLooseGroundHigh,c_red);
part_type_alpha3(		ptLooseGroundHigh,1,3,0);
part_type_speed(		ptLooseGroundHigh,4,6,-.1,0);
part_type_direction(	ptLooseGroundHigh,30,150,0,0);
part_type_orientation(	ptLooseGroundHigh,0,359,3,0,0);
part_type_gravity(		ptLooseGroundHigh,.30,270);
part_type_life(			ptLooseGroundHigh,10,20);
part_type_size(			ptLooseGroundHigh,.8,1.3,-.02,0);

//Slide particles
ptSlide = part_type_create()
part_type_sprite(		ptSlide,maskPart,0,0,0)
part_type_colour1(		ptSlide,c_white)
part_type_alpha3(		ptSlide,1,3,0)
part_type_speed(		ptSlide,.2,1,-.02,0);
part_type_direction(	ptSlide,15,165,0,0);
part_type_orientation(	ptSlide,0,359,3,0,0)
part_type_gravity(		ptSlide,.050,90);
part_type_life(			ptSlide,10,30);
part_type_size(			ptSlide,1,1.5,-.02,0)