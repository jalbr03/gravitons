for(j=array_length_1d(players)-1;j>=0;j--){
	if(instance_exists(players[j])){
		target = players[j];
		exit;
	}
}