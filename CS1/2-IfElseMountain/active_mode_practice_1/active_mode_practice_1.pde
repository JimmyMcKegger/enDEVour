//moving line

void setup()
{
  size(500, 300);
  background(255);
}

int lineX = width/4;

void draw()
{
  fill(0);
  circle(lineX, height/8, 10);
  
  //moving 1 pixel at a time
  lineX += 1;
}
