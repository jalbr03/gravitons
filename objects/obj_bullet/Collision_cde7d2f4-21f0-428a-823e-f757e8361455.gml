with(other){
	if(shieldON == true){
		shieldHP -= damage;
	}
}
if(other.shieldON == true) instance_destroy();