//question 2, jumping monster


final color backgroundColor = color(255);
final color headColor = color(155, 121, 190);
final int monsterWidth = 40;
final int monsterHeight = 25;

int headX;
int headY;

void setup()
{
  size(400, 400);
  rectMode(CENTER);

  //start the monster in teh center of the screen
  headX = width/2;
  headY = height/2;
}

void draw()
{
  background(backgroundColor);
  drawMonster(headX, headY, monsterWidth, monsterHeight, headColor);
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

//update the monster's position by clicking
void mouseClicked()
{
  headX = mouseX;
  headY = mouseY;
}
