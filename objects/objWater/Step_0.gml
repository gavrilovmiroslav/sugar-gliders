if GAME.go {
	
	n += .05;
 
		var i = 0;
		while i < springs {
			var tar = (y-ds_grid_get(springgrid,i,0)),
				hsp = (lerp(ds_grid_get(springgrid,i,1),(tar*spd),lrp))*dampen;
			
			ds_grid_set(springgrid,i,1,hsp);	
			ds_grid_add(springgrid,i,0,hsp);
		
			if (i = 0) || (i = springs-1) {
			if !shallows {
			var ypos = clamp(ds_grid_get(springgrid,i,0),y-springsize,y+springsize)
			} else {var ypos = clamp(ds_grid_get(springgrid,i,0),y-(springsize*.5),y+(springsize*.5))}
			ds_grid_set(springgrid,i,0,ypos)
			}
		
			ds_grid_set(springgrid,i,2,0);
			ds_grid_set(springgrid,i,3,0);

			i += 1;
		}
	
	
	repeat(iterations){
	
		var i = 0;
		while i < springs {
		var lyy = -1, ryy = -1, yy = ds_grid_get(springgrid,i,0);
			if ((i-1) >= 0)			{lyy = ds_grid_get(springgrid,i-1,0)}
			if ((i+1) < springs)	{ryy = ds_grid_get(springgrid,i+1,0)}
		

			if lyy != -1 {
				if (abs(y-lyy) < abs(y-yy)){
					var ld = spread*(yy-lyy);
					ds_grid_set(springgrid,i,2,ld);
					ds_grid_add(springgrid,i-1,1,ld);
					}
				}

			if ryy != -1 {
				if (abs(y-ryy) < abs(y-yy)){
					var rd = spread*(yy-ryy);
					ds_grid_set(springgrid,i,3,rd);
					ds_grid_add(springgrid,i+1,1,rd);
					}
				}
		
		
		i += 1;
		}


		var i = 0;
		while i < springs {
		var ldiff = ds_grid_get(springgrid,i,2), rdiff = ds_grid_get(springgrid,i,3);
		if ((i-1) >= 0)			{ds_grid_add(springgrid,i-1,0,ldiff);}
		if ((i+1) < springs)	{ds_grid_add(springgrid,i+1,0,rdiff);}
		i += 1;
		}
	}

}

