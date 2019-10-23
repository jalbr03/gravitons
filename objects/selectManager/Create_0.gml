window_set_fullscreen(true);
P1ingame = false;
P2ingame = false;
P3ingame = false;
P4ingame = false;
gamepads_left = [0,1,2,3,4,5,6,7,8,9,10,11];

for(j=11;j>=0;j--){
	gamepad_set_axis_deadzone(j,0.7);
}

P1chose = "";
P2chose = "";
P3chose = "";
P4chose = "";

Redis = 0;
Orangeis = 0;
Blueis = 0;
Purpleis = 0;

playersChoose = [P1chose,P2chose,P3chose,P4chose];
playersselect = [obj_player_select1,obj_player_select2,obj_player_select3,obj_player_select4];
colors = [Redis,Orangeis,Blueis,Purpleis];
