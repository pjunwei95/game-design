/// @desc move to gameover room
if (sprite_index == spr_hungry_ghost_walking) {
	with (obj_player)
	{
	
		SlideTransition(TRANS_MODE.GOTO,other.target);
		audio_play_sound(hui_lucyscream, 1, 0);
		audio_stop_sound(hui_afterlifeBGM);
	}
}
