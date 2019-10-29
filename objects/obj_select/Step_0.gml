if(R >= 255-colorIntensetyMod) colorTO = "blue";
if(B >= 255-colorIntensetyMod) colorTO = "green";
if(G >= 255-colorIntensetyMod) colorTO = "red";
colorChangespd = random_range(1,maxrange);
if(colorTO == "green"){
	if(R > maxrange) R-=colorChangespd;
	if(B > maxrange) B-=colorChangespd;
	if(G <= 255)G+=colorChangespd;
}if(colorTO == "blue"){
	if(R > maxrange) R-=colorChangespd;
	if(B <= 255)B+=colorChangespd;
	if(G > maxrange) G-=colorChangespd;
}if(colorTO == "red"){
	if(R <= 255)R+=colorChangespd;
	if(B > maxrange) B-=colorChangespd;
	if(G > maxrange) G-=colorChangespd;
}
image_blend = make_color_rgb(R,G,B);

if(ready == true){
	spd += 0.08;
	x -= spd;
}if(ready == false){
	if(spd > 0)spd -= 0.08;
	x -= spd;
	if(spd < 0) spd = 0;
}