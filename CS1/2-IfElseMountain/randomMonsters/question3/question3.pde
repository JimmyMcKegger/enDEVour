//question 3, multiple monsters

final color backgroundColor = color(255);

//set monster 1 variables
int monsterWidth1 = randomWidth();
int monsterHeight1 = randomHeight();
int monsterX1 = randomX();
int monsterY1 = randomY();
color monsterColor1 = randomColor();

//set monster 2 variables
int monsterWidth2 = randomWidth();
int monsterHeight2 = randomHeight();
int monsterX2 = randomX();
int monsterY2 = randomY();
color monsterColor2 = randomColor();

//set monster 3 variables
int monsterWidth3 = randomWidth();
int monsterHeight3 = randomHeight();
int monsterX3 = randomX();
int monsterY3 = randomY();
color monsterColor3 = randomColor();

void setup()
{
  size(600, 550);
  rectMode(CENTER);
}
    
void draw()
{
   background(backgroundColor);
   
   drawMonster(monsterX1, monsterY1, monsterWidth1, monsterHeight1, monsterColor1);
   drawMonster(monsterX2, monsterY2, monsterWidth2, monsterHeight2, monsterColor2);
   drawMonster(monsterX3, monsterY3, monsterWidth3, monsterHeight3, monsterColor3);
}

//if the monsters overlap or you don't like the colours you can click to reset
void mouseClicked()
{
//reset monster 1 variables
monsterWidth1 = randomWidth();
monsterHeight1 = randomHeight();
monsterX1 = randomX();
monsterY1 = randomY();
monsterColor1 = randomColor();

//reset monster 2 variables
monsterWidth2 = randomWidth();
monsterHeight2 = randomHeight();
monsterX2 = randomX();
monsterY2 = randomY();
monsterColor2 = randomColor();

//reset monster 3 variables
monsterWidth3 = randomWidth();
monsterHeight3 = randomHeight();
monsterX3 = randomX();
monsterY3 = randomY();
monsterColor3 = randomColor();
}

void drawMonster(int x, int y, int width, int height, color fillColor)
{ 
  final int eyeRadius = 5;
 
  fill(fillColor);
  rect(x, y, width, height);

  // Draw the left ear
  triangle(x - width/4, // x1
           y - height/2, // y1
           x - width/4 - 10, // x2
           y - height/2, // y2
           x - width/4 - 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the right ear
  triangle(x + width/4, // x1
           y - height/2, // y1
           x + width/4 + 10, // x2
           y - height/2, // y2
           x + width/4 + 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the left eye
  ellipse(x - width/5,
          y - height/4,
          eyeRadius * 2,
          eyeRadius * 2);
 
 // Draw the right eye
 ellipse(x + width/5,
         y - height/4,
         eyeRadius * 2,
         eyeRadius * 2);
}

//function to generate random widths
int randomWidth()
{
 return int(random(40, 100));
}

//function to generate random heights
int randomHeight()
{
  return int(random(30, 95));
}

//function to place the monster's X location
int randomX()
{
  return int(random(50, 550));
}

//function to place monster's Y location
int randomY()
{
  return int(random(50, 500));
}

//function to generate random colours
color randomColor()
{ 
  return color(random(255), random(255), random(255));
}
