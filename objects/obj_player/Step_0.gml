// Player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_wall)) && (key_jump)
{
	vsp = -8;
	
}


// Horizontal collision
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}
x = x + hsp;

// Vertical collision
if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}
y = y + vsp;

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
		vsp = -2;
	}
	if (keyboard_check(vk_down))
	{
		vsp = 2;
	}	
}
