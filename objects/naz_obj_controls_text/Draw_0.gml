
	draw_set_font(font_main);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text((view_wport[0]-96)/1.8,(view_hport[0]-96)/5, "Controls");
	//draw_text(room_get_viewport(0,3)/2,room_get_viewport(0,4)/2, "Paused");
	
	
	draw_set_font(font_main);
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_text(930,700, s2_button[0]);
	