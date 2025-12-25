
if (keyboard_check_released(ord("B")))
{
	var v = audio_get_master_gain(0) - 0.1
	audio_set_master_gain(0, max(v, 0))
}

if (keyboard_check_released(ord("N")))
{
	var v = audio_get_master_gain(0) + 0.1
	audio_set_master_gain(0, min(v, 1))
}

if (keyboard_check_released(ord("M")))
{
	audio_set_master_gain(0, 0)
}
