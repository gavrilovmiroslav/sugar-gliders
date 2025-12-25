draw_self();

draw_set_font(fntDebug);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

fpsavg -= (fpsavg-fps_real)*.01;
draw_text(32,64,string(round(fpsavg))+string(" frames/sec")+"  ("+string(fps)+" steps/sec)");
draw_text(32,80,string(((1/fps_real)/(1/60))*100)+string("% of frametime"));
if !fulldebug {draw_text(32,96,"Press F3 for full debug");} else {
	draw_text(32,96,"Press F3 to hide full debug");
	draw_text(32,128,"Buttons pressed (L/R/U/D/A1/A2): "+string(keyboard_check(GAME.keyleft))+string(keyboard_check(GAME.keyright))+string(keyboard_check(GAME.keyup))+string(keyboard_check(GAME.keydown))+string(keyboard_check(GAME.keyact1))+string(keyboard_check(GAME.keyact2)));
	}