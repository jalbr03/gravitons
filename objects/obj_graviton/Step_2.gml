/// @description shield
shieldActivate = gamepad_button_check_pressed(game_pad, (gp_face2))
	||gamepad_button_check_pressed(game_pad, (gp_face3))||gamepad_button_check_pressed(game_pad, (gp_face4))
	||gamepad_button_value(game_pad, (gp_shoulderlb))||gamepad_button_value(game_pad, (gp_shoulderl))
	||gamepad_button_value(game_pad, (gp_shoulderr))||gamepad_button_value(game_pad, (gp_shoulderrb));
//\\shield//\\
if(shieldActivate && cooldown == false){
	shield = instance_create_layer(x,y,"Instances",obj_Grav_shield);
	cooldown = true;
	if(alarm[0] == -1)alarm[0] = global.shieldtime*2;
}
if(shield != noone && instance_exists(shield)){
	shield.x = x;
	shield.y = y;
}
if(cooldown == true && !instance_exists(shield)){
	if(!instance_exists(Ring)) Ring = instance_create_layer(x,y,"Instances",obj_Grav_shield_ring);
	with(Ring){
		x = other.x;
		y = other.y;
	}
}if(cooldown == false){
	instance_destroy(Ring);
}

if(place_meeting(x,y,obj_bullet)){
	if(!instance_exists(shield))room_goto(room_select);
}