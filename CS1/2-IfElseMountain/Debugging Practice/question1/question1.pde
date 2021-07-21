size(500,500);
background(255);

//fixed the height and width variable names
int houseWidth = 150;
int houseHeight = 200;
int houseX = width/2;
int houseY = height*2/3; //<>//

fill(70, 162, 31);
rect(0, height*2/3, width, height/3);

fill(234,210,121);

rectMode(CENTER);
//swapped the height and width arguments because they were backwards 
rect(houseX, houseY, houseWidth, houseHeight);

fill(234, 121, 125);
triangle(houseX + houseWidth/2, //x1
          // changed the comment below to label the point correctly
         houseY - houseHeight/2, //y2 
         houseX - houseWidth/2, //x2
         houseY - houseHeight/2, //y2
         //Changed the next line to use the center of the house on the X axis
         houseX, //x3
         houseY - houseHeight/2 - 100);//y3
