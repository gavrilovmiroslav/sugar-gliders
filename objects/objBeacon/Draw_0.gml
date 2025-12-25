//////////////////////////////////////
//DRAW////////////////////////////////
//////////////////////////////////////
draw_sprite_ext(maskPart,0,x,y+(sin(n)*8)-(active*64),2,2,rot,c_white,1);

//If active, draw our text
if (active > 0) {
	
	height = string_height_ext(text,-1,180);
	draw_sprite_ext(maskPart,0,x,y+(sin(n)*8)-(active*64),active*24,active*((height/8)+2),0,c_white,1);
	
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_colour(c_dkgray32);
	draw_text_ext_transformed(x,y+(sin(n)*8)-(active*64),text,-1,180,active,active,0)
	
	draw_set_colour(c_white);
	
}
