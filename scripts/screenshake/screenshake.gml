///screenshake(time, intensity, priority)
///@description 
///@param time
///@param intensity
///@param priority
function screenshake(argument0, argument1, argument2) {

	//Strongest active screenshake takes priority unless priority argument is true
	if ((argument1 > CAM.scrshki) || (CAM.scrshk <= 0)) or (argument2) {
		CAM.scrshk = argument0;
		CAM.scrshki = argument1;
	}


}
