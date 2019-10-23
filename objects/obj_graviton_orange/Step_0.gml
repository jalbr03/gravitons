left = gamepad_axis_value(selectManager.Orangeis,gp_axislh) < 0;
right = gamepad_axis_value(selectManager.Orangeis,gp_axislh) > 0;
SWgravity = gamepad_button_check_pressed(selectManager.Orangeis,gp_face1);

//\\moving calc//\\
var move = right - left;
hsp = move * movesp;
//gravity direction check//\\
if(grvdirection == 1) vsp += grv;
if(grvdirection == -1) vsp -= grv;

//\\Gravity calc//\\
if(place_meeting(x,y+vsp,obj_is_static)){
	while(!place_meeting(x,y+sign(vsp),obj_is_static)){
		y+=sign(vsp);
	}
	vsp = 0;
if(SWgravity){
		if(grvdirection == -1) {
			grvdirection = 1;
			exit;
		}
		if(grvdirection == 1) {
			grvdirection = -1;
			exit;
		}
	}
}
y += vsp;

//\\moving/side colision calc//\\
if(place_meeting(x+hsp,y,obj_is_static)){
	while(!place_meeting(x+sign(hsp),y,obj_is_static)){
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp

//\\animation//\\
if(left || right){
	image_speed = movesp;
	if(left && !right) image_xscale = 1*sign(grvdirection);
	if(right && !left) image_xscale = -1*sign(grvdirection);
}else{
	image_speed = 0;
}
