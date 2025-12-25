//////////////////////////////////////
//VARIABLES///////////////////////////
//////////////////////////////////////
rot += 4;
n += .05;

//Update activation status
if (instance_exists(activator)) {
	if (point_distance(x,y,activator.x,activator.y) < actdist) {
		active -= (active-1)*.2
	} else {active -= (active)*.2}
} else {active -= (active)*.2}