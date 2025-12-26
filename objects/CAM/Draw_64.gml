//Animation fluff
if (irandom(120) = 30 && image_yscale > .9) {image_yscale = 0;}
image_yscale -= (image_yscale-1)*.2

//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
if (should_fade_in)
{
	fade = fade + 0.005
	zoomtar += 1.5
}
else if (should_fade_out)
{
	fade = fade - 0.01
	if (fade <= 0)
	{
		fade = 0
		should_fade_out = false
	}
}

var s = ds_list_size(objTail.children)
if (s > 0)
{
	draw_set_halign(fa_center);
	for (var i = 0; i < s; i += 1)
	{
		var last = objTail.children[| s - 1 - i]
		draw_text(x, y - 30 - i * 16, last.name);
	}
	draw_set_halign(fa_left);
}

draw_sprite_ext(sprite_index,image_index,x - room_width,y - room_height,image_xscale + room_width,image_yscale + room_height,0,c_white,fade);