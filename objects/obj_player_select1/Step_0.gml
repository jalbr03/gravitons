left = gamepad_axis_value(game_pad,gp_axislh)<0;
right = gamepad_axis_value(game_pad,gp_axislh)>0;
select = gamepad_button_check_pressed(game_pad, gp_face1);

if(asigned == false){
	for(i=array_length_1d(selectManager.gamepads_left)-1;i>=0;i--){
		if(gamepad_button_check(selectManager.gamepads_left[i],gp_face1) && selectManager.gamepads_left[i] != -1){
			game_pad = selectManager.gamepads_left[i];
			selectManager.gamepads_left[i] = -1;
			asigned = true;
			exit;
		}
	}
}
if(asigned == true){
	sprite_index = spr_players;
	selectManager.P1ingame = true;
	if(left && cusormoved == false){
		playerselect --;
		cusormoved = true;
	}if(right && cusormoved == false){
		playerselect ++;
		cusormoved = true;
	}if(!left && !right){
		cusormoved = false;
	}
	
	if(selectManager.P2chose != playerselect && selectManager.P3chose != playerselect && selectManager.P4chose != playerselect){
		image_index = playerselect-1;
		if(select){
			selectManager.P1chose = playerselect;
		}
	}
	if(selectManager.P2chose == playerselect || selectManager.P3chose == playerselect || selectManager.P4chose == playerselect){
		image_index = playerselect+3;
	}
	
}
if(playerselect <= 0) playerselect = 4;
if(playerselect >= 5) playerselect = 1;