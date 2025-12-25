
//Update zoom
zoom -= (zoom-zoomtar)*zoomspd;
zoomtar += (mouse_wheel_down()-mouse_wheel_up())*100;
camera_set_view_size(cam1,zoom,zoom/aspr)

//Handle screenshake
if (scrshk > 0) {
scrshk = max(scrshk-1,0);
var ssx = random_range(-scrshki,scrshki),
	ssy = random_range(-scrshki,scrshki);
} else {
var ssx = 0,
	ssy = 0;
}

//Move the camera
switch (type) {
case 0:	
	//Do nothing
break;

case 1:		
	xs -= (xs-tar.x)*camspd;
	ys -= (ys-tar.y)*camspd;

	camera_set_view_pos(cam1,xs-(zoom/2)+ssx,ys-((zoom/2)/aspr)+ssy);
break;

case 2:
	camxadd -= (camxadd-(objPlayer.hsp*20))*.05
	xs -= (xs-(tar.x+camxadd))*camspd;
	ys -= (ys-(tar.y))*camspd;

	camera_set_view_pos(cam1,xs-(zoom/2)+ssx,ys-((zoom/2)/aspr)+ssy);
break;

case 3:
	camera_set_view_pos(cam1,tar.x-(zoom/2)+ssx,tar.y-((zoom/2)/aspr)+ssy);
break;
}
