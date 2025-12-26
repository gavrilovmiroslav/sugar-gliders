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

if (is_bg_music_swap)
{
	audio_sound_gain(originalBGMusicID, 0, swap_fade_time);
	audio_sound_gain(ilijaBGMusicID, 1, swap_fade_time);
	is_bg_music_swap = false;
	is_swap_timer_started = true;
	swap_timer = swap_time;
}

if (is_swap_timer_started)
{
	swap_timer = swap_timer - delta_time / 1000000;
	show_debug_message(swap_timer);
	if (swap_timer <= 0.0)
	{
		
		is_swap_timer_started = false;
		audio_sound_gain(originalBGMusicID, 0.5, swap_fade_time);
		audio_sound_gain(ilijaBGMusicID,0, swap_fade_time);
	}
}
