window_set_fullscreen(true);
P1ingame = false;
P2ingame = false;
P3ingame = false;
P4ingame = false;
P1chose = "";
P2chose = "";
P3chose = "";
P4chose = "";


gamepads_left = [0,1,2,3,4,5,6,7,8,9,10,11];
for(j=11;j>=0;j--){
	gamepad_set_axis_deadzone(j,0.7);
}
playersChoose = [P1chose,P2chose,P3chose,P4chose];
players = [obj_graviton_red,obj_graviton_orange,obj_graviton_blue,obj_graviton_purple];
playersGamePads = [obj_player_select1.game_pad,obj_player_select2.game_pad,obj_player_select3.game_pad,obj_player_select4.game_pad];
