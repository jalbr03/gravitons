with(other){
	if(shieldON == true){
		if(spin == false){
			other.fallowspd = -other.bouncespd;
			other.x -= sign(x - other.x)*3;
		}
	}
}if(other.uptospin == true){
	instance_destroy();
}