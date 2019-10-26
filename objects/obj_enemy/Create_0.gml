target = 0;

players = [obj_graviton_red, obj_graviton_orange, obj_graviton_blue, obj_graviton_purple]

avragX = 0;
for(i=array_length_1d(players)-1;i>=0;i--){
	avragX += players[i];
}
avragX /= array_length_1d(players);
startingX = x;

alarm[1] = 30;

shoottime = 0;

spd = 1;
fallowspd = spd;
fallowspeedUp = 0.04;
bouncespd = spd*2;