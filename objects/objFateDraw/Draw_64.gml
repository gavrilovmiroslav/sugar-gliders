if (should_fade_out) {
	fade = fade - 0.01
	
	if (fade <= 0)
	{
		should_fade_out = false;
	}
}

var lHeight = 18;
var xt = 32;
var yt = 62;

draw_text(xt, 32, "OUR FATES");

for (var i = 0; i < ds_list_size(global.fates.generated_fates); i++)
{
	var e = global.fates.generated_fates[| i];
	var fate = e.fate;
	if (ds_list_find_index(global.fates.killed, e.name) == -1)
	{
		fate = string_replace(fate, "would've ", "had ");
		draw_set_colour(c_red);
	}
	else
	{
		fate = string_replace(fate, ".", ", but died. ");
		draw_set_colour(c_white);
	}
	draw_text(xt, yt + i * lHeight, e.name + ": " + fate);
}

draw_sprite_ext(icoEye,0,x - room_width,y - room_height,image_xscale + room_width,image_yscale + room_height,0,c_white,fade);

draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(10 * xt + 5 * sin(current_time / 100), 432, "Thank you for playing SUGAR GLIDERS");
draw_text(10 * xt + 5 * sin(current_time / 100 + 0.2), 432 + lHeight, "a game about blessings in disguise.");
draw_text(10 * xt + 5 * sin(current_time / 100 + 0.4), 432 + lHeight * 3, "Created in two days. Team:");
draw_text(10 * xt + 5 * sin(current_time / 100 + 0.4), 432 + lHeight * 4, "Milica Todorovic");
draw_text(10 * xt + 5 * sin(current_time / 100 + 0.6), 432 + lHeight * 5, "Darinka Zobenica");
draw_text(10 * xt + 5 * sin(current_time / 100 + 0.8), 432 + lHeight * 6, "Aleksandar Zdravkovic");
draw_text(10 * xt + 5 * sin(current_time / 100 + 1.0), 432 + lHeight * 7, "Miroslav Gavrilov");
draw_text(10 * xt + 5 * sin(current_time / 100 + 1.4), 432 + lHeight * 9, "Be kind to one another.");

draw_text(30 * xt + 5 * sin(current_time / 100 + 0.4), 432 + lHeight * 2, "Special thanks to");
draw_text(30 * xt + 5 * sin(current_time / 100 + 0.6), 432 + lHeight * 3, "Ilija Pantelic (metal song cover) and");
draw_text(30 * xt + 5 * sin(current_time / 100 + 0.8), 432 + lHeight * 4, "Aleksandra Blagojevic (*rocks* and *attitude*)");
draw_text(30 * xt + 5 * sin(current_time / 100 + 0.8), 432 + lHeight * 5, "and many others who became sugar gliders ;)");

draw_set_halign(fa_left);

draw_text(1000, 650, "[ESC] to exit.");
if (keyboard_check_released(vk_escape))
{
	game_end(0);
}
