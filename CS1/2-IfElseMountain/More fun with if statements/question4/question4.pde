/*
Question 4
Make a program that lets you draw triangles. 
You should start with a blank screen. 
When you first press the mouse button, you should draw a circle where the mouse is. 
The next time that you press the mouse button, 
you should draw another circle at the new location. 
The third time that you press the mouse button, 
you should draw a circle, and then draw a triangle using these 3 circles at the 
3 points of your triangle. Your program should allow you to draw as many 
triangles as you want.
*/

// question 4, triangles

final color purple = color(93, 24, 155);
final color green = color(0, 232, 0);
final color yellow = color(240, 240, 0);

final int pointSize = 20;

int p1X;
int p1Y;
int p2X;
int p2Y;

int pointerCounter = 0;


void setup()
{
  size(600, 500);
  background(purple);
  ellipseMode(CENTER);
}

void draw()
{
}

void mouseClicked()
{
  //draw a yellow circle
  fill(yellow);
  ellipse(mouseX, mouseY, pointSize, pointSize);
 
  // fill in the triangle
  switch(pointerCounter) 
  {
  case 0: 
    p1X = mouseX;
    p1Y = mouseY;
    pointerCounter++;
    break;
  case 1: 
    p2X = mouseX;
    p2Y = mouseY;
    line(p1X, p1Y, p2X, p2Y);
    pointerCounter++;
    break;
  case 2: 
    line(mouseX, mouseY, p1X, p1Y);
    line(mouseX, mouseY, p2X, p2Y);
    fill(green);
    triangle(p1X, p1Y, p2X, p2Y, mouseX, mouseY);
    pointerCounter = 0;
    break;
    }
}
