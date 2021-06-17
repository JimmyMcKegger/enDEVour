// Basic drawing question 3, yellow rectangle on purple background

size(600, 400);

background(126, 41, 224);

//calculate the size of the smaller rect

float W = float(width);
float H = float(height);

rectMode(CENTER);
fill(221, 224, 41);

rect(width/2, height/2, W*(1.0/3.0), H*(1.0/3.0));
