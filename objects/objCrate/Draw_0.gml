//////////////////////////////////////
//DRAW CRATE//////////////////////////
//////////////////////////////////////

draw_self()
//Draw tracejtory if being held

switch (grabbed)
{
	case 1:
		var steps = 10;
		var xd = (32+abs(objPlayer.hsp))*objPlayer.flip;
		var yd = -2;
		//draw_line(x+xtrans, y+ytrans, x+xtrans + (xd  * steps), y+ytrans + (yd * steps));
		
		var xst =x+xtrans;
		var yst = y+ytrans;
		
		for (var i = 0; i < steps; i += 1)
		{
			if (place_meeting(xst, yst, objSolid))
				break;
				
			draw_line(xst, yst, xst + xd, yst + yd);
			xst = xst + xd;
			yst = yst + yd;
			yd = yd+2;
		}
}