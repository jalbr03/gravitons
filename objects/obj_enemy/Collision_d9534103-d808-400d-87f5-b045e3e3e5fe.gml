with(other){
	if(shieldON == true){
		if(spin == false){
			other.fallowspd = -other.bouncespd;
		}
	}
}if(other.uptospin == true){
	instance_destroy();
}