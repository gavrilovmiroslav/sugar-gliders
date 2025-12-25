
if position_meeting(x, y, objPlayer) && sprite_index == sugar_cube_tmp_thingie
{
	sprite_index = sugar_cube_tmp_eat
	global.soundDB.PlayRandomSound(global.soundDB.crunch_sounds);
}

if sprite_index == sugar_cube_tmp_eat && image_index >= image_number - 1 {
	instance_destroy(self)
}