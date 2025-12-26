var lHeight = 24;
var xt = 32;
var yt = 32;

for (var i = 0; i < ds_list_size(global.fates.generated_fates); i++)
{
	var e = global.fates.generated_fates[| i];
	draw_text(xt, yt + i * lHeight, e.name + ": " + e.fate);
}