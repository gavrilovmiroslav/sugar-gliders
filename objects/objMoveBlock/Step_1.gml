if GAME.go {

//////////////////////////////////////
//MOVE UNITS//////////////////////////
//////////////////////////////////////
#region
//Get a list of all units on top of self
//collision_line_list(x,y-1,x+width-1,y-1,parUnit,0,0,list,0);
collision_rectangle_list(x,y-1,x+width-1,y-1+min(0,vsp),parUnit,0,0,list,0)
	
//If there is anything in this list, have each of them move at the same speed of the platform (if possible)
if !ds_list_empty(list) {
	var size = ds_list_size(list) , i = 0, vhsp = hsp, vvsp = vsp, me= id;
		
	//Cycle through the list and perform forced movement
	while i < size {
		with (ds_list_find_value(list,i)) {
			#region Perform forced hsp movement
			if (y+hh <= me.y) && (!free){
					
				switch (sign(vhsp)) {
					case  1:
					    repeat(abs(vhsp)) {
							if !collision_line(x+hw,y-hh,x+hw,y+hh-1,parSolid,0,0) {
								x += sign(vhsp);
								forceh = sign(vhsp); //This variable keeps track of the last forced movement
							} 
						}
					    break;
							
					case -1:
					    repeat(abs(vhsp)) {
							if !collision_line(x-hw-1,y-hh,x-hw-1,y+hh-1,parSolid,0,0) {
								x += sign(vhsp);
								forceh = sign(vhsp); //This variable keeps track of the last forced movement
							}
						}
					    break;
							
				}
					
			}
			#endregion			
			#region Perform forced vsp movement
			if (y+hh <= me.y) {
					
				switch (sign(vvsp)) {
						
					case  1:
					    repeat(abs(vvsp)) {
							if !collision_line(x-hw,y+hh,x+hw-1,y+hh,parSolid,0,0) {
								y += sign(vvsp);
								forcev = sign(vvsp); //This variable keeps track of the last forced movement
							} 
						}
					    break;
							
					case -1:
					    repeat(abs(vvsp)) {
							if !collision_line(x-hw,y-hh-1,x+hw-1,y-hh-1,parSolid,0,0) {
								y += sign(vvsp);
								forcev = sign(vvsp); //This variable keeps track of the last forced movement
							}
						}
					    break;
				}
					
			}
			#endregion
		}
		i += 1;
	}
		
//We are done, clear the list
ds_list_clear(list);
}
#endregion	

//////////////////////////////////////
//MOVE SELF///////////////////////////
//////////////////////////////////////
#region
//If the platform is moving horizontally, move + bounce
if (hsp != 0) {
	x += hsp;

	if (collision_line(x+width+hsp-1,y,x+width+hsp-1,y+height-1,parSolid,0,0) || collision_line(x+hsp,y,x+hsp,y+height-1,parSolid,0,0)) {
		hsp = -hsp;
	}
}
	
//If the platform is moving vertically, move + bounce
if (vsp != 0) {
	y += vsp;

	if (collision_line(x,y+height-1+vsp,x+width-1,y+height-1+vsp,parSolid,0,0) || collision_line(x,y+vsp,x+width-1,y+vsp,parSolid,0,0))  {
		vsp = -vsp;
	}
}
#endregion
}