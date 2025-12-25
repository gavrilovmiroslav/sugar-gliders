global.soundDB = id;

splat_sounds = [glider_splat, Splat2, Splat3];
whine_sound = [baby_cry, baby_moan, puppy_whine];
bg_music = [jump_higher_run_faster, jump_and_run___tropics];



//irandom will return the same results on each new run, so we have to call 'randomize' once the game starts
randomise();

//Use this to play a random sound from an array - returns sound ID so we can stop the sound later

PlayRandomSound = function(soundArray, loop = false, priority = 1, gain = 1)
{
	arrLength = array_length(soundArray);
	if (arrLength < 0)
	{
		show_error("Hej ti, pozvao si PlayRandomSoun metodu sa praznim nizom!", false);
		return;
	}
	
	randomIndex = irandom(arrLength - 1);
	return audio_play_sound(soundArray[randomIndex], priority, loop, gain);
}

global.soundDB.PlayRandomSound(global.soundDB.bg_music, true);