//moving line

void setup()
{
  size(500, 300);
  background(255);
}

int dotX = width/4;

void draw()
{  
  //reset background
  background(255);

  //draw a circle
  fill(0);
  circle(dotX, height - (height/8), 10);

  //moving 1 pixel at a time
  dotX += 1;
}
