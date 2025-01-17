// Player input
if (hascontrol)
{
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space);
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

// jump sound
if (key_jump) && !audio_is_playing(hui_jump)
{
		audio_play_sound(hui_jump, 5, 0);
}



// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_greenwall)) && (key_jump)
{
	vsp = -8;
	
}

if (place_meeting(x,y+1,obj_bluewall)) && (key_jump)
{
	vsp = -8;
	
}

if (place_meeting(x,y+1,obj_yellowwall)) && (key_jump)
{
	vsp = -8;
	
}

if (place_meeting(x,y+1,obj_redwall)) && (key_jump)
{
	vsp = -8;
	
}

if (place_meeting(x,y+1,obj_greywall)) && (key_jump)
{
	vsp = -8;
	
}
// Horizontal collision
if (place_meeting(x+hsp,y,obj_greenwall))
{
	while (!place_meeting(x+sign(hsp),y,obj_greenwall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}

if (place_meeting(x+hsp,y,obj_bluewall))
{
	while (!place_meeting(x+sign(hsp),y,obj_bluewall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}

if (place_meeting(x+hsp,y,obj_yellowwall))
{
	while (!place_meeting(x+sign(hsp),y,obj_yellowwall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}

if (place_meeting(x+hsp,y,obj_redwall))
{
	while (!place_meeting(x+sign(hsp),y,obj_redwall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}

if (place_meeting(x+hsp,y,obj_greywall))
{
	while (!place_meeting(x+sign(hsp),y,obj_greywall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}

if (place_meeting(x+hsp,y,obj_destroyablewall))
{
	while (!place_meeting(x+sign(hsp),y,obj_destroyablewall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}
x = x + hsp;


// Vertical collision
if (place_meeting(x,y+vsp,obj_greenwall))
{
	while (!place_meeting(x,y+sign(vsp),obj_greenwall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}
if (place_meeting(x,y+vsp,obj_bluewall))
{
	while (!place_meeting(x,y+sign(vsp),obj_bluewall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}
if (place_meeting(x,y+vsp,obj_yellowwall))
{
	while (!place_meeting(x,y+sign(vsp),obj_yellowwall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}
if (place_meeting(x,y+vsp,obj_redwall))
{
	while (!place_meeting(x,y+sign(vsp),obj_redwall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}
if (place_meeting(x,y+vsp,obj_greywall))
{
	while (!place_meeting(x,y+sign(vsp),obj_greywall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}
if (place_meeting(x,y+vsp,obj_destroyablewall))
{
	while (!place_meeting(x,y+sign(vsp),obj_destroyablewall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}
y += vsp;

// Gravity
if (place_free(x,y+1) && !place_meeting(x,y,obj_ladder))
{
	grv = 0.5;
}
else
{
	grv = 0;
}

// Ladder
if (place_meeting(x,y,obj_ladder)) 
{
 grv = 0;
 vsp = 0;
 if (keyboard_check(vk_up))
 {
  vsp = -3;
  if (!audio_is_playing(hui_climb))
  {
   audio_play_sound(hui_climb,1,0);
  }
 }
 if (keyboard_check(vk_down))
 {
  vsp = 3;
  if (!audio_is_playing(hui_climb))
  {
   audio_play_sound(hui_climb,1,0);
  }
 } 
}

// Action Key
action_key = keyboard_check_pressed(ord("Z"))

// Interacting with obj_table_with_rice
if (action_key)
{
	if (global.chopsticks == 1)
	{
		if (place_meeting(x,y,obj_table_with_rice))
		{
			global.tablewithrice = 1;
			instance_deactivate_object(obj_table_with_rice);
			obj_table_with_rice_and_chopsticks.visible = true;
			audio_play_sound(hui_chopsticksintorice, 1, 0);
		}
	}
}	

// Interacting with obj_table_with_rice_boss
if (action_key)
{
	if (global.chopsticks_boss == 1)
	{
		if (place_meeting(x,y,obj_table_with_rice_boss))
		{
			global.tablewithrice_boss = 1;
			instance_deactivate_object(obj_table_with_rice_boss);
			obj_table_with_rice_and_chopsticks_boss.visible = true;
			audio_play_sound(hui_chopsticksintorice, 1, 0);
		}
	}
}	


// Interacting with obj_tut_table_with_rice
if (action_key)
{
	if (global.tut_chopsticks == 1)
	{
		if (place_meeting(x,y,obj_tut_table_with_rice))
		{
			global.tut_tablewithrice = 1;
			instance_deactivate_object(obj_tut_table_with_rice);
			obj_tut_table_with_rice_and_chopsticks.visible = true;
			audio_play_sound(hui_chopsticksintorice, 1, 0);
		}
	}
}	

// Interacting with obj_door_missing_shard
if (action_key)
{
	if (!instance_exists(obj_shard))
	{
		if (place_meeting(x,y,obj_door_missing_shard))
		{
			if (global.fulldoor = 1)
			{
			audio_play_sound(hui_insertmirror, 1, 0);
			}
		}
	}
}	

if (action_key)
{
	if (!instance_exists(obj_shard))
	{
		if (place_meeting(x,y,obj_door_missing_shard))
		{
			global.fulldoor = 0;
			global.portal = 0;
		}
	}
}	



// Interacting with obj_tut_door_missing_shard
if (action_key)
{
	if (!instance_exists(obj_tut_shard))
	{
		if (place_meeting(x,y,obj_tut_door_missing_shard))
		{
			if (global.tut_fulldoor = 1)
			{
			audio_play_sound(hui_insertmirror, 1, 0);
			}
		}
	}
}	

if (action_key)
{
	if (!instance_exists(obj_tut_shard))
	{
		if (place_meeting(x,y,obj_tut_door_missing_shard))
		{
			global.tut_fulldoor = 0;
			global.tut_portal = 0;
		}
	}
}	

// Interacting with obj_door_missing_shard_boss
if (action_key)
{
	if (!instance_exists(obj_boss_shard)) && (!instance_exists(obj_boss_shard1))
	{
		if (place_meeting(x,y,obj_door_missing_shard_boss))
		{
			if (global.fulldoor_boss = 1)
			{
			audio_play_sound(hui_insertmirror, 1, 0);
			}
		}
	}
}	

if (action_key)
{
	if (!instance_exists(obj_boss_shard)) && (!instance_exists(obj_boss_shard1))
	{
		if (place_meeting(x,y,obj_door_missing_shard_boss))
		{
			global.fulldoor_boss = 0;
			global.portal_boss = 0;		
		}
	}
}	

// Interacting with obj_insense1
if (action_key)
{
	if (place_meeting(x,y,obj_insense1))
	{
		global.insense1 = 0;
		global.angryghost1 = 1;
		audio_play_sound(hui_incenseupright, 1, 0);
	}
}	

// Interacting with obj_insense2
if (action_key)
{
	if (place_meeting(x,y,obj_insense2))
	{
		global.insense2 = 0;
		global.angryghost2 = 1;
		audio_play_sound(hui_incenseupright, 1, 0);
	}
}

// Interacting with obj_insense3
if (action_key)
{
	if (place_meeting(x,y,obj_insense3))
	{
		global.insense3 = 0;
		global.angryghost3 = 1;
		audio_play_sound(hui_incenseupright, 1, 0);
	}
}

// Interacting with obj_tut_insense
if (action_key)
{
	if (place_meeting(x,y,obj_tut_insense))
	{
		global.tut_insense = 0;
		global.tut_angryghost = 1;
		audio_play_sound(hui_incenseupright, 1, 0);
	}
}

// Interacting with obj_insense_boss
if (action_key)
{
	if (place_meeting(x,y,obj_insense_boss))
	{
		global.insense_boss = 0;
		global.angryghost_boss1 = 1;
		audio_play_sound(hui_incenseupright, 1, 0);
	}
}	

// Interacting with obj_insense_boss1
if (action_key)
{
	if (place_meeting(x,y,obj_insense_boss1))
	{
		global.insense_boss1 = 0;
		global.angryghost_boss2 = 1;
		audio_play_sound(hui_incenseupright, 1, 0);
	}
}	

// Interacting with obj_portal to go to boss stage
if (place_meeting(x,y,obj_portal)) && (global.stage2 = 1) && (action_key)
{
	with (obj_player)
	{
		if (hascontrol)	
		{
			hascontrol = false;
			room_goto(boss_stage_real);
			instance_destroy(obj_player);
			audio_play_sound(hui_changestage, 1, 0);
		}	
	}
}

// Interacting with obj_portal to go to endgame
if (place_meeting(x,y,obj_portal_boss)) && (global.endgame = 1) && (action_key)
{
	with (obj_player)
	{
		if (hascontrol)	
		{
			hascontrol = false;
			room_goto(endgame);
			instance_destroy(obj_player);
			audio_play_sound(hui_changestage, 1, 0);
		}	
	}
}

// tutorial level
if place_meeting(x,y,obj_tut_portal) && (global.tut_stage1 = 1) && (action_key)
{
	room_goto(stage1);
	instance_destroy(obj_player);
	
	audio_play_sound(hui_changestage, 1, 0);
}

// Interacting with obj_generator_off
if (action_key)
{
	if (global.wrench == 1)
	{
		if (place_meeting(x,y,obj_generator_off))
		{
			audio_play_sound(hui_generatoron,2,0);
			audio_sound_gain(hui_generatoron,0,0);
			audio_sound_gain(hui_generatoron,0.6,2000);
			audio_play_sound(hui_lighton,2,0);
			audio_sound_gain(hui_lighton,0,0);
			audio_sound_gain(hui_lighton,0.1,1);
		}
	}
}
			

if (action_key)
{
	if (global.wrench == 1)
	{
		if (place_meeting(x,y,obj_generator_off))
		{
			global.generator = 1;
			instance_deactivate_object(obj_generator_off);
			obj_generator_on.visible = true;
			global.light = 1;
		}
	}
}	

// Animation
if (!place_meeting(x,y+1,obj_greenwall))
{
	sprite_index = spr_player_jumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;		
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (!place_meeting(x,y+1,obj_bluewall))
{
	sprite_index = spr_player_jumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (!place_meeting(x,y+1,obj_yellowwall))
{
	sprite_index = spr_player_jumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (!place_meeting(x,y+1,obj_redwall))
{
	sprite_index = spr_player_jumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (!place_meeting(x,y+1,obj_greywall))
{
	sprite_index = spr_player_jumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (!place_meeting(x,y+1,obj_destroyablewall))
{
	sprite_index = spr_player_jumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}


if (hsp != 0) image_xscale = sign(hsp);

if (place_meeting(x,y,obj_ladder)) 
{
	if (key_left) or (key_right)
	{
		sprite_index = spr_player_running;
		image_speed = 1;
	}
	else
	{
	sprite_index = spr_player_climbing;
	image_speed = 1;
	}
}