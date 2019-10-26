/// @description abilities
shieldActivate = gamepad_button_check_pressed(game_pad, (gp_face2));
chargeAtack = gamepad_button_check(game_pad, (gp_face3));

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