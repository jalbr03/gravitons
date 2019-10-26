averageY = 0;
sumofY = 0
numberOfgarvs = 0;
for(i=array_length_1d(gravitons)-1;i>=0;i--;){
	if(instance_exists(gravitons[i])){
		sumofY += gravitons[i].y;
		numberOfgarvs += 1;
	}
}
averageY = sumofY/numberOfgarvs;
y += (averageY - y)*0.1;


