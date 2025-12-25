switch (touched) {
    case 0:
        draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,image_blend,1);
        break;
    case 1:
	if GAME.go{
        draw_sprite_ext(sprite_index,image_index,x+irandom(5)*choose(-1,1),y+irandom(5)*choose(-1,1),1,1,0,image_blend,1);} else {
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,image_blend,1)
		}
        break;
	case 2:
		draw_sprite_ext(sprite_index,image_index,x,y+yadd,1,1,0,image_blend,1);
		break;
}
