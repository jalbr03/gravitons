shoottime = choose(0,90,120,200);

if(startingX < avragX){
	if(P1.x > target.x) target = P1;
	if(P2.x > target.x) target = P2;
	if(P3.x > target.x) target = P3;
	if(P4.x > target.x) target = P4;
}

image_angle = point_direction(x,y,target.x,target.y);
move_towards_point(target.x,target.y,1)

if(alarm[0] == -1) alarm[0] = shoottime;