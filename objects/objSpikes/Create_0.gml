//directionEnum
//0 - up
//1 - down
//2 - left
//3 - right

if (jumpySpike == true)
{
	pokingHeight = 0;
	spikeSpeed = 1;
	if (directionEnum == 1 || directionEnum == 3) spikeSpeed = spikeSpeed * -1;
	playerApproached = false;
	height = sprite_get_height(sprite_index);
	width = sprite_get_width(sprite_index);
	if (directionEnum == 0) //up
	{
		y = y + height;
	}
	else if (directionEnum == 1) //down
	{
		y = y - height;
	}
	else if (directionEnum == 2) // left
	{
		x = x + width;
	}
	else if (directionEnum == 3) // right
	{
		x = x - width;
	}
}