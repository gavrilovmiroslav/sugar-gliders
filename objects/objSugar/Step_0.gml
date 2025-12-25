
if collision_circle(x, y, 32, objPlayer,true,true) && sprite_index == sugar_cube_tmp_thingie
{
	sprite_index = sugar_cube_tmp_eat
	global.soundDB.PlayRandomSound(global.soundDB.crunch_sounds);
}

if sprite_index == sugar_cube_tmp_eat && image_index >= image_number - 1 {
	var pla = instance_nearest(x, y, objTail);
	var bab = instance_create_depth(x, y, 0, objBaby, { owner: pla });
	
	instance_destroy(self)
}