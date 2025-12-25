//////////////////////////////////////
//DRAW PLAYER/////////////////////////
//////////////////////////////////////
var _mat = matrix_build(x,y+hh,0,0,0,0,1,1,2); //Create a matrix that chooses where the player is drawn and how he is stretched.
ex_mat = _mat
matrix_set(matrix_world,_mat);								 //Set the matrix as the world matrix

h = flip
if (slide != 0 || onledge) h = -h

if (ex_state != states.whip && should_whip)
{
	should_whip = 0
	ex_state = states.whip;
	sprite_index = anim_whip;
	image_index = 0;
}

// 0 = Idle
// 1 = Moving left
// 2 = Moving right
// 3 = Falling
// 4 = Moving left in air
// 5 = moving right in air

var spd = 0.1
var cidx = image_index
var idx = cidx + spd

if (idx >= image_number - 1)
{
	if (ex_state == states.whip)
	{
		animstate = 0;
		image_index = idx;
		ex_state = states.idle;
	}
	else if (animstate < 3)
	{
		image_index = 0
	}
}
else
{
	image_index = idx
}

if (ex_state != states.whip)
{
	if (slide != 0 || onladder || onrope || onledge) {
		ex_state = states.wall;
		sprite_index = anim_wall;
	}
	else if (animstate == 0) 
	{
		ex_state = states.idle;
		sprite_index = anim_idle;
	}
	else if (animstate == 1 || animstate == 2)
	{
		ex_state = states.run;
		sprite_index = anim_run;
	}
	else if (animstate == 3)
	{
		ex_state = states.fall;
		sprite_index = anim_fall;
	}
	else if (animstate == 4 || animstate == 5)
	{
		ex_state = states.jump;
		sprite_index = anim_jump;
	}
}

if ((invincible mod 10) < 5)								 //If the player is not invicible
{
	draw_sprite_ext(
		sprite_index, image_index,
		0, 0,
		2 * h, 2,
		drot * 0.1,
		c_white, 1);
}
		
		//Draw the player. Notice the player is drawn at x0y0 as 
		//the matrix that we created above already moves the player to the right x and y position.

matrix_set(matrix_world,mat_ident);							 //Reset the world matrix