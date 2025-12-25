if (jumpySpike == true)
{
	height = sprite_get_height(sprite_index);
	y = y + height;
	pokingHeight = 0;
	spikeSpeed = 1;
	playerApproached = false;
}