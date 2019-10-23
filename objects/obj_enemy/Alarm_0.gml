shot = instance_create_layer(x,y,layer,obj_bullet);

with(shot){
	image_angle = other.image_angle;
	move_towards_point(other.target.x,other.target.y,3);
}