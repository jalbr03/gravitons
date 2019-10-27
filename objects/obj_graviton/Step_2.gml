/// @description abilities
shieldActivate = gamepad_button_check_pressed(game_pad, (gp_face2));
chargeAtack = gamepad_button_check(game_pad, (gp_face3));
grapling = gamepad_button_check(game_pad, (gp_face4));
graple_onClick = gamepad_button_check_pressed(game_pad, (gp_face4));
//\\//\\graple movement//\\//\\
left = gamepad_axis_value(game_pad,gp_axislh) < 0;
right = gamepad_axis_value(game_pad,gp_axislh) > 0;
up = gamepad_axis_value(game_pad,gp_axislv) < 0;
down = gamepad_axis_value(game_pad,gp_axislv) > 0;

//\\moving calc//\\
var movehorizontal = right - left;
var movevertical = down - up;
hsp = movehorizontal * movesp;
upsp = movevertical * movesp;

//\\making shield when posible//\\
if(!instance_exists(shield)){
	shield = instance_create_layer(x,y,"Instances",obj_Grav_shield);
}
//keeping shield on player
shield.x = x;
shield.y = y;

//\\togling shield//\\
if(shieldActivate){
	if(cooldown == false && shieldON == false){
		shieldON = true;
		exit;
	}
	if(shieldON == true){
		shieldON = false;
		exit;
	}
}
if(shieldHP <= 0.5) {
	cooldown = true;
	shieldON = false;
	if(alarm[0] == -1)alarm[0] = global.shieldtime;
}if(shieldHP > 0.5 && shieldHP <= shieldHPfull/1.5){
	shield.sprite_index = spr_grav_shield_blink;
	shield.image_speed = 4;
}else{
	shield.sprite_index = spr_grav_shield;
}

//\\activating shield and changing size relative to HP//\\
if(shieldON == true) shield.image_alpha = 1;
if(shieldON == false && cooldown == false){
	shield.image_alpha = 0.4;
	if(alarm[1] == -1) alarm[1] = regentime*fps;
}
shield.image_xscale = shieldHP/shieldHPfull;
shield.image_yscale = shieldHP/shieldHPfull;

//\\ring for shield cool down//\\
if(cooldown == true){
	if(!instance_exists(Ring)) Ring = instance_create_layer(x,y,"Instances",obj_Grav_shield_ring);
}with(Ring){
	x = other.x;
	y = other.y;
}

//\\if charge is false and shield is true and touching enemy than bounce//\\
//code is in enemy

//\\charge//\\
if(shieldON == true && chargeAtack){
	if(image_speed < 5) imgspd += 0.05;
	image_speed += imgspd;
	if(image_speed > 4) uptospin = true
	if(image_speed < 4) uptospin = false;
}else{
	imgspd = 0;
	uptospin = false;
}

//\\graple//\\

if(graple_onClick){
	grapleX = x;
	grapleY = y;
}
///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\\\/\//\\\  || (y == grapleY+grapleRadius || y == grapleY-grapleRadius)
if(shieldON == false && grapling){
	isgrapled = true;
		if(x+hsp >= grapleX+grapleRadius || x+hsp <= grapleX-grapleRadius || place_meeting(x+hsp,y,obj_is_static)){
			hsp = 0;
		}else{
			x += sign(hsp);
		}
		x += hsp
		//up and down
		if(y+upsp >= grapleY+grapleRadius || y+upsp <= grapleY-grapleRadius|| place_meeting(x,y+upsp,obj_is_static)){
			upsp = 0;
		}else{
			y += sign(upsp);
		}
		y += upsp
}else{
	isgrapled = false;
}
///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\\\/\//\\\

















/*
if(global.shieldON == false && grapling){
	isgrapled = true;
	if(y < grapleY+grapleRadius && y > -grapleY+grapleRadius){
		if(place_meeting(x,y+upsp,obj_is_static)){
			while(!place_meeting(x,y+sign(upsp),obj_is_static)){
				y += sign(upsp);
			}
			upsp = 0;
		}
		y += upsp
	}if(x < grapleX+grapleRadius && x > -grapleX+grapleRadius){
		if(place_meeting(x+hsp,y,obj_is_static)){
			while(!place_meeting(x+sign(hsp),y,obj_is_static)){
				x += sign(hsp);
			}
			hsp = 0;
		}
		x += hsp
	}else{
		x += (grapleX - x);
	}
}else{
	isgrapled = false;
}


