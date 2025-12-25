//Animation fluff
if (irandom(120) = 30 && image_yscale > .9) {image_yscale = 0;}
image_yscale -= (image_yscale-1)*.2

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);