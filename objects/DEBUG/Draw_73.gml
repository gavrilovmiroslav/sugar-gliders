draw_set_font(fntDebug);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (fulldebug) {
	
	with(objRopeBlock) {physics_draw_debug();}
	with(objRopePart)  {physics_draw_debug();}
	with(parLadder)	   {draw_circle((xind*size)+size*.5,(yind*size)-size*.5,3,1);}
	
	//draw_text(32,48,"Paused: "+string(!GAME.go));
	
	switch (debugtype) {
	    case 0: //Units
		#region
	        if instance_exists(parUnit) {
			var unit = instance_nearest(mouse_x,mouse_y,parUnit);
			draw_line(mouse_x,mouse_y,unit.x,unit.y);
			draw_circle(unit.x,unit.y,max(unit.hw,unit.hh),1);
			draw_set_alpha(.6)
			draw_set_color(c_black32)
			draw_rectangle(mouse_x,mouse_y-32-8,mouse_x+350,mouse_y+i+8,0);
			draw_set_color(c_ltwhite32)
			draw_set_alpha(1)
			draw_rectangle(mouse_x,mouse_y-32-8,mouse_x+350,mouse_y+i+8,1);
			
			i = 0;
			draw_circle(mouse_x,mouse_y,4,1);
			draw_text(mouse_x+8,mouse_y-32,"Current debug type: Units [RMB to change]")
			draw_text(mouse_x+8,mouse_y,"Current object for debug: "+string(object_get_name(unit.object_index))); i+= 16
			draw_text(mouse_x+8,mouse_y+i,"Xpos/Ypos: "+string(unit.x)+"/"+string(unit.y));  i+= 16
			if (variable_instance_exists(unit,"hsp") && variable_instance_exists(unit,"vsp")) {draw_text(mouse_x+8,mouse_y+i,"Hor/ver speed: "+string(unit.hsp)+"/"+string(unit.vsp));  i+= 16}
			if (variable_instance_exists(unit,"free") ) {draw_text(mouse_x+8,mouse_y+i,"In air: "+string(unit.free));  i+= 16}
			if (variable_instance_exists(unit,"slide") ) {draw_text(mouse_x+8,mouse_y+i,"Sliding: "+string(unit.slide));  i+= 16}
			if (variable_instance_exists(unit,"onrope") ) {draw_text(mouse_x+8,mouse_y+i,"On rope/cd: "+string(unit.onrope)+"/"+string(max(0,unit.ropecd)));  i+= 16}
			if (variable_instance_exists(unit,"onladder") ) {draw_text(mouse_x+8,mouse_y+i,"On ladder/cd: "+string(unit.onladder)+"/"+string(max(0,unit.laddercd)));  i+= 16}
			if (variable_instance_exists(unit,"djump") ) {draw_text(mouse_x+8,mouse_y+i,"Double jumps left: "+string(unit.djump));  i+= 16}
			if (variable_instance_exists(unit,"rot") && variable_instance_exists(unit,"drot") ) {draw_text(mouse_x+8,mouse_y+i,"Rotation/drawn rotation: "+string(unit.rot)+"/"+string(unit.drot));  i+= 16}
			if (variable_instance_exists(unit,"flip") && variable_instance_exists(unit,"dflip") ) {draw_text(mouse_x+8,mouse_y+i,"Looking direction/drawn xscale: "+string(unit.flip)+"/"+string(sin(unit.dflip)));  i+= 16}
			if (variable_instance_exists(unit,"floorcolor")) {draw_text(mouse_x+8,mouse_y+i,"Floorcolor: "+string(unit.floorcolor)); draw_circle_colour(mouse_x+16+string_width("Floorcolor: "+string(unit.floorcolor)),mouse_y+i+7,6,unit.floorcolor,unit.floorcolor,0) i+= 16}
			if (variable_instance_exists(unit,"bufjump")) {draw_text(mouse_x+8,mouse_y+i,"Jump input buffering: "+string(max(0,unit.bufjump)));  i+= 16}
			if (variable_instance_exists(unit,"onfloor")) {draw_text(mouse_x+8,mouse_y+i,"Ledge forgiveness: "+string(max(0,unit.onfloor)));  i+= 16}
			if (variable_instance_exists(unit,"ltimeout") && variable_instance_exists(unit,"rtimeout") ) {draw_text(mouse_x+8,mouse_y+i,"Wall jump control lockout L/R: "+string(max(0,unit.ltimeout))+"/"+string(max(0,unit.rtimeout)));  i+= 16}
			if (variable_instance_exists(unit,"width") && variable_instance_exists(unit,"height") ) {draw_text(mouse_x+8,mouse_y+i,"Bounding box size W/H: "+string(unit.width)+"/"+string(unit.height));  i+= 16}
			if (variable_instance_exists(unit,"vrelease") ) {draw_text(mouse_x+8,mouse_y+i,"vrelease: "+string(unit.vrelease));  i+= 16}
			
			draw_line(mouse_x,mouse_y-32,mouse_x,mouse_y+i)
			}
		#endregion
	        break;
	    case 1: //Blocks
		#region
	        if instance_exists(parBlock) {
			var block = instance_nearest(mouse_x,mouse_y,parBlock), blocksize = 36;
			draw_line(mouse_x,mouse_y,block.x,block.y);
			draw_circle(block.x,block.y,4,1);
			draw_set_alpha(.6)
			draw_set_color(c_black32)
			draw_rectangle(mouse_x,mouse_y-32-8,mouse_x+400,mouse_y+i+8,0);
			draw_set_color(c_ltwhite32)
			draw_set_alpha(1)
			draw_rectangle(mouse_x,mouse_y-32-8,mouse_x+400,mouse_y+i+8,1);
			
			i = 0;
			draw_circle(mouse_x,mouse_y,4,1);
			draw_text(mouse_x+8,mouse_y-32,"Current debug type: Blocks [RMB to change]")
			draw_text(mouse_x+8,mouse_y,"Current object for debug: "+string(object_get_name(block.object_index))); i+= 16
			draw_text(mouse_x+8,mouse_y+i,"Xpos/Ypos: "+string(block.x)+"/"+string(block.y));  i+= 16
			draw_text(mouse_x+8,mouse_y+i,"Xscale/Yscale: "+string(block.image_xscale)+"/"+string(block.image_yscale));  i+= 16
			draw_rectangle(block.x,block.y,block.x+blocksize*block.image_xscale,block.y+blocksize*block.image_yscale,1)
			if (variable_instance_exists(block,"hsp") && variable_instance_exists(block,"vsp")) {draw_text(mouse_x+8,mouse_y+i,"Hor/ver speed: "+string(block.hsp)+"/"+string(block.vsp));  i+= 16}
			
			draw_line(mouse_x,mouse_y-32,mouse_x,mouse_y+i)
			}
		#endregion
	        break;
	}
	
}