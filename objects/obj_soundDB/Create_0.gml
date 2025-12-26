global.soundDB = id;

splat_sounds = [glider_splat, Splat2, Splat3];
whine_sound = [baby_cry, baby_moan, puppy_whine];
bg_music = [jump_and_run___tropics];
crunch_sounds = [crunch, bone_crunch];
death_sounds = [Death_6];

swap_timer = 0.0;
originalBGMusicID = -1;
ilijaBGMusicID = -1;

//irandom will return the same results on each new run, so we have to call 'randomize' once the game starts
randomise();

//Use this to play a random sound from an array - returns sound ID so we can stop the sound later

PlayRandomSplatSound = function()
{
	PlayRandomSound(splat_sounds);
	event_user(0);
}

PlayBGMusic = function()
{
	originalBGMusicID = audio_play_sound(jump_and_run___tropics, 10, true, 0.5);
	ilijaBGMusicID = audio_play_sound(ilija, 10,true,0);
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

//if music == noone {
//	music = global.soundDB.PlayRandomSound(global.soundDB.bg_music, true);
//}

PlayBGMusic();