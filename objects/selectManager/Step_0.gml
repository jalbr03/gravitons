if(room == room_select){
	playersGamePads = [obj_player_select1.game_pad,obj_player_select2.game_pad,obj_player_select3.game_pad,obj_player_select4.game_pad];
}

if(instance_exists(levelManager)){
	x = levelManager.x;
	y = levelManager.y;
	gamepads_left = [0,1,2,3,4,5,6,7,8,9,10,11];
	playersChoose = [P1chose,P2chose,P3chose,P4chose];
	P1ingame = false;
	P2ingame = false;
	P3ingame = false;
	P4ingame = false;
	P1chose = "";
	P2chose = "";
	P3chose = "";
	P4chose = "";
	for(k=4;k>=0;k--){
		for(l=4;l>0;l--){
			if(playersChoose[l-1] == k){
				if(!instance_exists(players[k-1]))createdPlayer = instance_create_layer(x,y,layer,players[k-1]);
				createdPlayer.game_pad = playersGamePads[l-1];
			}
		}
	}
}

