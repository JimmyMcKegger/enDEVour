//looked up how to do this in active mode so that I could add the pixel troubleshooting function to the bottom

void setup() { 
  size(500, 500);
}

void draw() {
//sky
background(110, 210, 210);

//sun
strokeWeight(2);
fill(218, 222, 45);
circle(80, 80, 100);

//grass
noStroke();
fill(0, 250, 0);
rect(0, 330, 510, 200);

//looked up how to do this in active mode so that I could add the pixel troubleshooting function to the bottom

void setup() { 
  size(500, 500);
}

  int catHeadX = 250;
  int catHeadY = 275;
  int catHeadWidth = 90;
  int catHeadHeight = 110;
  
  int catBodyX = catHeadX + 50;
  int catBodyY = catHeadY + 100;
  int catBodyWidth = 150;
  int catBodyHeight = 120;

void draw() {
//sky
background(110, 210, 210);

//sun
strokeWeight(2);
fill(218, 222, 45);
circle(80, 80, 100);

//grass
noStroke();
fill(0, 250, 0);
rect(0, 330, 510, 200);

//cat body
stroke(0);
strokeWeight(1);
fill(220, 175, 35);
ellipse(catBodyX, catBodyY, catBodyWidth, catBodyHeight);

//cat head
ellipse(catHeadX, catHeadY, catHeadWidth, catHeadHeight);

//feet
circle(catBodyX - catBodyWidth/3, catBodyY + catBodyHeight/2 - 5, 20);
circle(catBodyX - catBodyWidth/5, catBodyY + catBodyHeight/2, 20);
circle(catBodyX + catBodyWidth/3, catBodyY + catBodyHeight/2 - 5, 20);
circle(catBodyX + catBodyWidth/5, catBodyY + catBodyHeight/2, 20);

//tail
ellipse(catBodyX + catBodyWidth/2.5, catBodyY - catBodyHeight/2.5, 10, 40);

int catEarWidth = 15;
int catEarOffset = 10;

//ears
triangle( catHeadX - catHeadWidth/4 + catEarWidth/2, 
          catHeadY - catHeadHeight/2 + catEarOffset, 
          catHeadX - catHeadWidth/4, 
          catHeadY - catHeadHeight/2 - catEarWidth + catEarOffset, 
          catHeadX - catHeadWidth/4 - catEarWidth/2, 
          catHeadY - catHeadHeight/2 + catEarOffset);
triangle(  catHeadX + catHeadWidth/4 + catEarWidth/2, 
           catHeadY - catHeadHeight/2 + catEarOffset, 
           catHeadX + catHeadWidth/4, 
           catHeadY - catHeadHeight/2 - catEarWidth + catEarOffset, 
           catHeadX + catHeadWidth/4 - catEarWidth/2, 
           catHeadY - catHeadHeight/2 + catEarOffset);

//eyes
fill(0);
ellipse(catHeadX - 18, catHeadY - 15, 5, 10);
ellipse(catHeadX + 18, catHeadY - 15, 5, 10);

//nose
ellipse(catHeadX, catHeadY + 20, 10, 15);

}

//void mouseClicked() {
//  print("pixel: " + mouseX + ", " + mouseY + "\n");
//}
