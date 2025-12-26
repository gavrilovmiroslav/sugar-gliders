//////////////////////////////////////
//CAMERA SETTINGS/////////////////////
//////////////////////////////////////
//Vars
window_set_caption("Sugar Gliders")

xs		= x;			//X position to look at
ys		= y;			//Y position to look at
tar		= objPlayer;	//Target to follow

type	= 1;			//Camera type
						// 0 = Static
						// 1 = Chase Player
						// 2 = Predict player hsp
						// 3 = Instant
						
camspd	= .15;			//Camera speed (between .05 and .3 usually, where 0 is no movement and 1 is instant).
zoomspd	= .1;			//Camera zooming in and out speed
camxadd = 0;			//Used for camera type 2
scrshk	= 0;			//Screenshake time
scrshki = 6;			//Screenshake intensity

zoomtar	= 1280;			//Target zoom
zoom	= zoomtar;		//How far we are zoomed in
aspr	= (1280/720);	//Aspect ratio

//Create Camera
cam1	= camera_create();
camera_set_view_size(cam1,1280,720);
camera_set_view_pos(cam1,tar.x-(zoom/2),tar.y-((zoom/2)/aspr));
view_set_camera(0,cam1);