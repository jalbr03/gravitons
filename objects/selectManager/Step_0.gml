if(room_get_name(room_select) == true){
	for(i=0;i>=4;i++){
		for(j=0;j>=4;j++){
			if(playersChoose[j] == i) colors[i] = playersselect[i].game_pad;
		} 
	}
}

if(instance_exists(levelManager)){
	if(!instance_exists(obj_graviton_red)){
		if(P1chose == 1 || P2chose == 1 || P3chose == 1 || P4chose == 1)
			instance_create_layer(x,y,layer,obj_graviton_red);
	}if(!instance_exists(obj_graviton_orange)){
		if(P1chose == 2 || P2chose == 2 || P3chose == 2 || P4chose == 2)
			instance_create_layer(x,y,layer,obj_graviton_orange);
	}if(!instance_exists(obj_graviton_blue)){
		if(P1chose == 3 || P2chose == 3 || P3chose == 3 || P4chose == 3)
			instance_create_layer(x,y,layer,obj_graviton_blue);
	}if(!instance_exists(obj_graviton_purple)){
		if(P1chose == 4 || P2chose == 4 || P3chose == 4 || P4chose == 4)
			instance_create_layer(x,y,layer,obj_graviton_purple);
	}
}

