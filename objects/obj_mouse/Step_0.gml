if(R >= 255-colorIntensetyMod) colorTO = "blue";
if(B >= 255-colorIntensetyMod) colorTO = "green";
if(G >= 255-colorIntensetyMod) colorTO = "red";

if(colorTO == "green"){
	if(R > 0) R--;
	if(B > 0) B--;
	if(G <= 255)G++;
}if(colorTO == "blue"){
	if(R > 0) R--;
	if(B <= 255)B++;
	if(G > 0) G--;
}if(colorTO == "red"){
	if(R <= 255)R++;
	if(B > 0) B--;
	if(G > 0) G--;
}

image_blend = make_color_rgb(R,G,B);

x = mouse_x;
y = mouse_y;
