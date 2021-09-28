// Practice Drawing With While Loops
// Question 1

int numRectangles = 24;
int rectNum = 0;

int spaceBetween = 10;
int rectHeight = 80;
int rectWidth = 40;

color red = color(240, 10, 10);
color blue = color(10, 10, 240);

void setup()
{
  size(1260, 180);
  background(120);
}

void draw()
{
  while (rectNum <= numRectangles)
  {
    int rectX = spaceBetween*(rectNum+1) + rectWidth*rectNum;
    int rectY = 50;
 
    fill(255);
    rect(rectX, 50, rectWidth, rectHeight);
 
    if ((rectNum + 1) % 2 == 0)
    {
      fill(blue);
    }
    else
    {
      fill(red);
    }
    
    if (rectNum + 1 > 9)
    {
      text(rectNum + 1, rectX + rectWidth/2 - 7, rectY + rectHeight/2);
    }
    else 
    {
      text(rectNum + 1, rectX + rectWidth/2, rectY + rectHeight/2);
    }

    rectNum++;
  }
}
