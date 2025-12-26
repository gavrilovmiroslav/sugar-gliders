
var size = ds_list_size(children)
if (size > 0 && keyboard_check_released(ord("Z")))
{
	owner.should_whip = 1
	var child = children[| size - 1]
	instance_destroy(child)
	ds_list_delete(children, size - 1)
	
	var crate = instance_create_layer(x, y, "Instances", objCrate, { name: child.name });
	
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
	
	with crate {
		idd.docols			= 1;
		idd.image_xscale	= 1;
		grabbed				= 0;
		objCrate.grabcd		= 6;
		vsp					= -2;
		hsp					= (32+abs(objPlayer.hsp))*objPlayer.flip;
		objPlayer.grabobject= 0;
		active				= 1;
		xtrans				= 0;
		ytrans				= 0;
		x					= round(x);
		y					= round(y);
		
		//play whine sound
		whine_sound_id = global.soundDB.PlayRandomSound(global.soundDB.whine_sound);
		flying = 1;
	}
}