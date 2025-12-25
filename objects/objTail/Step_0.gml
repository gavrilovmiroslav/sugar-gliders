
var size = ds_list_size(children)
if (size > 0 && keyboard_check_released(ord("Z")))
{
	owner.should_whip = 1
	var child = children[| size - 1]
	instance_destroy(child)
	ds_list_delete(children, size - 1)
	objPlayer.DJA = size - 1
	
	var crate = instance_create_depth(x, y, 0, objCrate);
	
	with crate {
		grabbed				= 1;
		idd.docols			= 0;
		idd.image_xscale	= 0;
		objPlayer.grabobject= id;
		xtrans				= (x-(objPlayer.x)-objPlayer.flip*24);
		ytrans				= (y-objPlayer.y);
		xadd				= objPlayer.flip*24;
		x					= objPlayer.x+xadd;
		y					= objPlayer.y;
	}
}