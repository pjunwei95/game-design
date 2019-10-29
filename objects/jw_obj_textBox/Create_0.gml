// tutorial at https://www.youtube.com/watch?v=Lxy8Q67HgD4&list=PLSFMekK0JFgzbFfj1vAsyluKTymnBiriY&index=21
box = spr_textbox;
frame = spr_portrait_frame;
portrait = spr_portraits;
namebox = spr_namebox;

box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

port_x = (global.game_width - box_width - port_width) * 0.5;
port_y = (global.game_height * 0.98) - port_height;
box_x = port_x;
box_y = port_y;
namebox_x = port_x;
namebox_y = box_y - namebox_height;

x_buffer = 12;
y_buffer = 8; //8
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_text_x = namebox_x + (namebox_width/2);
name_text_y = namebox_y + (namebox_height/2);
text_max_width = box_width - (2*x_buffer);

text[0] = "this is a test this is a test this is a test this is a test ";
text[1] = "testing text 2";
page = 0;
name = "???";

portrait_index = 0;


interact_key = ord("B");

text_col = c_black;
name_text_col = c_black;
font = fnt_dialogue;

draw_set_font(font);
text_height = string_height("M");
