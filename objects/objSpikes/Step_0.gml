if (jumpySpike && pokingHeight < height)
{	
	if (playerApproached == false)
	{	
		if (collision_circle(x, y, 80, objPlayer, false, true) != noone)
		{
			playerApproached = true;
		}
	}
	
	if (playerApproached == false) return;
	
	if (directionEnum == 0 || directionEnum == 1) // up/down
	{
		if (pokingHeight + abs(spikeSpeed) < height)
		{
			y = y - spikeSpeed;
			pokingHeight = pokingHeight + abs(spikeSpeed);
		}
		else
		{
			y = y + (height - pokingHeight) * sign(spikeSpeed);
			pokingHeight = height;
		}
	}
	else if (directionEnum == 2 || directionEnum == 3) // left/right
	{
		if (pokingHeight + abs(spikeSpeed) < width)
		{
			x = x + spikeSpeed;
			pokingHeight = pokingHeight + abs(spikeSpeed);
		}
		else
		{
			x = x + (width - pokingHeight) * sign(spikeSpeed);
			pokingHeight = width;
		}
	}
}