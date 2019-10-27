/// @description abilities
shieldActivate = gamepad_button_check_pressed(game_pad, (gp_face2));
chargeAtack = gamepad_button_check(game_pad, (gp_face3));
grappling = gamepad_button_check(game_pad, (gp_face4));
grapple_onClick = gamepad_button_check_pressed(game_pad, (gp_face4));
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

//\\grapple//\\


///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\\\/\//\\\  || (y == grapleY+grapleRadius || y == grapleY-grapleRadius)
if(place_meeting(x,y,obj_is_grappable) || place_meeting(x,y+1,obj_is_static) || place_meeting(x,y-1,obj_is_static)) is_touching_grappable = true;
if(!grappling) is_touching_grappable = false;
if(shieldON == false && grappling && is_touching_grappable == true){
	isgrappled = true;
		if(x+hsp > grappleX+grappleRadius || x+hsp < grappleX-grappleRadius || place_meeting(x+hsp,y,obj_is_static)){
			hsp = 0;
		}else{
			x += sign(hsp);
		}
		x += hsp
		//up and down
		if(y+upsp > grappleY+grappleRadius || y+upsp < grappleY-grappleRadius|| place_meeting(x,y+upsp,obj_is_static)){
			upsp = 0;
		}else{
			y += sign(upsp);
		}
		y += upsp
}else{
	isgrappled = false;
}
if(grapple_onClick && is_touching_grappable == true){
	grappleX = x;
	grappleY = y;
}if(isgrappled == false){
	grappleX = x;
	grappleY = y;
}
///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\\\/\//\\\
















