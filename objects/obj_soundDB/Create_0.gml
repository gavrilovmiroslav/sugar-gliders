global.soundDB = id;

splat_sounds = [glider_splat, Splat2, Splat3];
whine_sound = [baby_cry, baby_moan, puppy_whine];
bg_music = [jump_and_run___tropics];
crunch_sounds = [crunch, bone_crunch];
death_sounds = [Death_6];

swap_timer = 0.0;
originalBGMusicID = -1;
ilijaBGMusicID = -1;
underwaterBGMusicID = -1;
underwaterEffectID = -1;

isPlayingUnderwater = false;

//irandom will return the same results on each new run, so we have to call 'randomize' once the game starts
randomise();

//Use this to play a random sound from an array - returns sound ID so we can stop the sound later


#macro DEFAULT_VOLUME 0.5

StartWaterEffect = function()
{
	if (isPlayingUnderwater)
		return;
		
	isPlayingUnderwater = true;
	audio_sound_gain(originalBGMusicID, 0, 200);
	audio_sound_gain(underwaterBGMusicID, 0.5, 200);
	if (audio_is_playing(underwaterEffectID))
		audio_sound_gain(underwaterEffectID, 0.5, 200);
	else
		underwaterEffectID = audio_play_sound(underwater_ambience, 10, true, 0.5);
}

EndWatterEffect = function()
{
	if (!isPlayingUnderwater)
		return;
	
	isPlayingUnderwater = false;
	audio_sound_gain(underwaterEffectID, 0, 200);
	audio_sound_gain(originalBGMusicID, 0.5, 200);
	audio_sound_gain(underwaterBGMusicID, 0, 200);
}

PlayRandomSplatSound = function(playIlija = true)
{
	PlayRandomSound(splat_sounds);
	if (playIlija)
		event_user(0);
}

PlayJumpSound = function()
{
	var rpitch = random(1.5) + 0.5;
	var sound_instance = audio_play_sound(jump, 10, false, DEFAULT_VOLUME);
	audio_sound_pitch(sound_instance, rpitch);
}

PlayBGMusic = function()
{
	if (!audio_is_playing(originalBGMusicID))
		originalBGMusicID = audio_play_sound(jump_and_run___tropics, 10, true, 0.5);
		
	if (!audio_is_playing(ilijaBGMusicID))
		ilijaBGMusicID = audio_play_sound(ilija, 10,true,0);
		
	if (!audio_is_playing(underwaterBGMusicID))
		underwaterBGMusicID = audio_play_sound(jump_and_run___tropics_UNDERWATER, 10, true, 0);
}

PlayCreditsMusic = function()
{
	audio_stop_all()
	audio_play_sound(jump_higher_run_faster, 10, true, 0.5);
}

PlayRandomSound = function(soundArray, loop = false, priority = 1, gain = DEFAULT_VOLUME)
{
	arrLength = array_length(soundArray);
	if (arrLength <= 0)
	{
		show_error("Hej ti, pozvao si PlayRandomSoun metodu sa praznim nizom!", false);
		return;
	}
	
	randomIndex = irandom(arrLength - 1);
	return audio_play_sound(soundArray[randomIndex], priority, loop, gain);
}

audio_set_master_gain(0, 0.5)
//if music == noone {
//	music = global.soundDB.PlayRandomSound(global.soundDB.bg_music, true);
//}
