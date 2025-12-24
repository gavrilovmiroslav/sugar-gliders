
side = 1
grv = 0.2;
hsp = 0;
vsp = 0;

enum cat_states {
	idle,
	run,
	jump,
	fall
}

state_machine = new StateMachine()

hor_func = function(key_left, key_right)
{
	hsp = (key_right - key_left) * hsp_walk;

	var op = sign(hsp)
	if (place_meeting(x + hsp, y, obj_wall))
	{
		while (!place_meeting(x + op, y, obj_wall))
		{
			x = x + op
		}
		hsp = 0
	}
			
	if (sign(hsp) != 0)
	{
		image_xscale = sign(hsp)
	}
	x = x + hsp

	vsp = vsp + grv;
	op = sign(vsp)
	if (place_meeting(x, y + vsp, obj_wall))
	{
		while (!place_meeting(x, y + op, obj_wall))
		{
			y = y + op
		}
		vsp = 0
	}
	
	y = y + vsp
}

var _idle_state = new State()
_idle_state.on_enter = function() { 
	sprite_index = spr_idle;
	show_debug_message("IDLE");
}

_idle_state.on_update = function()
{
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check(vk_space);
	hor_func(key_left, key_right)
	
	if (!key_jump && (key_left || key_right))
	{
		state_machine.change(cat_states.run);
	}
	else if (key_jump)
	{
		state_machine.change(cat_states.jump);
	}
	else if (vsp > 0)
	{
		state_machine.change(cat_states.fall);
	}
}

var _run_state = new State()
_run_state.on_enter = function() {
	show_debug_message("RUN");
	sprite_index = spr_run;
}

_run_state.on_update = function()
{
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check(vk_space);
		
	hor_func(key_left, key_right)
	
	if (vsp > 0)
	{
		state_machine.change(cat_states.fall);
	}
	else if (!key_left && !key_right && !key_jump && vsp == 0) 
	{
		state_machine.change(cat_states.idle);
	}
	else if (key_jump && place_meeting(x, y + 1, obj_wall))
	{
		state_machine.change(cat_states.jump);
	}
}

var _jump_state = new State()
_jump_state.on_enter = function()
{	
	show_debug_message("JUMP");
	sprite_index = spr_jump;
	vsp = vsp_jump;
}

_jump_state.on_update = function()
{
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check(vk_space);
	hor_func(key_left, key_right)
	
	if (vsp > 0)
	{
		state_machine.change(cat_states.fall)
	}
	else if (vsp == 0 && instance_position(x, y + 1, obj_wall))
	{
		state_machine.change(cat_states.idle)
	}
}

var _fall_state = new State()
_fall_state.on_enter = function() {
	show_debug_message("FALL");
	sprite_index = spr_fall;
}

_fall_state.on_update = function()
{
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check(vk_space);
	hor_func(key_left, key_right)
	
	if (vsp == 0)
	{
		if (hsp != 0)
		{
			state_machine.change(cat_states.run)
		}
		else
		{
			state_machine.change(cat_states.idle)
		}
	}
}

state_machine.add(cat_states.idle, _idle_state)
state_machine.add(cat_states.run, _run_state)
state_machine.add(cat_states.jump, _jump_state)
state_machine.add(cat_states.fall, _fall_state)
state_machine.change(cat_states.idle)