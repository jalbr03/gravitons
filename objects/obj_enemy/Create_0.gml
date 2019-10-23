P1 = obj_graviton_red;
P2 = obj_graviton_orange;
P3 = obj_graviton_blue;
P4 = obj_graviton_purple;
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