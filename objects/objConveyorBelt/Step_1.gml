if GAME.go {
	
//////////////////////////////////////
//MOVE UNITS//////////////////////////
//////////////////////////////////////
#region
//Get a list of all units on top of self
collision_line_list(x,y-1,x+width-1,y-1,parUnit,0,0,list,0);
	
//If there is anything in this list, have each of them move at the  speed of the conveyor belt (if possible)
if !ds_list_empty(list) {
	var size = ds_list_size(list) , i = 0, vhsp = hsp, me= id;
		
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
		}
		i += 1;
	}
		
//We are done, clear the list
ds_list_clear(list);
}
#endregion	

}