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
	
	if (pokingHeight + spikeSpeed < height)
	{
		y = y - spikeSpeed;
		pokingHeight = pokingHeight + spikeSpeed;
	}
	else
	{
		y = y - height + pokingHeight;
		pokingHeight = height;
	}
}