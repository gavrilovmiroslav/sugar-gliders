//////////////////////////////////////
//DRAW ENEMY//////////////////////////
//////////////////////////////////////
var _mat = matrix_build(x,y+hh,0,0,0,0,xstretch,ystretch,1);
matrix_set(matrix_world,_mat);

if ((invincible mod 10) < 5)
	{draw_sprite_ext(maskPlayer,0,0,-hh,1,1,drot,c_white,1);}

matrix_set(matrix_world,mat_ident);