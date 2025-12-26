
if (room != rmFate)
{
	audio_stop_sound(originalBGMusicID);
	audio_stop_sound(ilijaBGMusicID);

	PlayBGMusic();
}
else
{
	PlayCreditsMusic();
}