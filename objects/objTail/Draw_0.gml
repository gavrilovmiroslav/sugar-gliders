/// @description Insert description here
// You can write your code in this editor

if (owner != noone)
{
	if (owner.ex_state == states.idle)
	{
		sprite_index = anim_idle;
		x = -12 * owner.h
		y = -10
	}
	else if (owner.ex_state == states.jump)
	{
		sprite_index = anim_jump;
		x = -12 * owner.h
		y = -10
	}
	else if (owner.ex_state == states.run)
	{
		sprite_index = anim_run;
		x = -10 * owner.h
		y = -10
	}
	else if (owner.ex_state == states.wall)
	{
		sprite_index = anim_wall;
		x = 1 * owner.h
		y = -10
	}
	else if (owner.ex_state == states.fall)
	{
		sprite_index = anim_fall;
		x = -12 * owner.h
		y = -10
	}
	
	matrix_set(matrix_world, owner.ex_mat);
	draw_sprite_ext(
		sprite_index, owner.image_index,
		x, y,
		2 * owner.h, 2,
		owner.drot * 0.1,
		c_white, 1);
	matrix_set(matrix_world, mat_ident);
	x = owner.x + x
	y = owner.y + y
	image_xscale = owner.image_xscale
}