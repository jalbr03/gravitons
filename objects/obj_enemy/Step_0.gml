shoottime = choose(0,200,300,400);
//\\targetting//\\
if(startingX < avragX){
	for(i=0;i<=array_length_1d(players)-1;i++){
		if(instance_exists(players[i]) && players[i].x > target.x) target = players[i];
	}
}

//\\speeding up to player//\\
if(fallowspd < spd)fallowspd += fallowspeedUp;

//\\fallowing players//\\
image_angle = point_direction(x,y,target.x,target.y);
move_towards_point(target.x,target.y,fallowspd)

//\\shooting//\\
if(alarm[0] == -1) alarm[0] = shoottime;
