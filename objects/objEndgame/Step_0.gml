/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, objPlayer)
{
	CAM.should_fade_in = true;
	
	if CAM.fade >= 1.0 {
		room_goto(rmFate);
	}
}