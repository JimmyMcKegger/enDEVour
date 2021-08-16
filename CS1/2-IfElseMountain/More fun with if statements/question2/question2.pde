// question 2 - b

final color blue = color(30, 0, 255);
final color green = color(0, 255, 0);

float dotX;
float dotY;
int dotSize = 25;
color dotColor;

void setup()
{
  size(700, 500);
  background(255);
  ellipseMode(CENTER);
  noStroke();
}

void draw()
{
  dot();
}

void dot()
{
  randomise();
  fill(dotColor);
  ellipse(dotX, dotY, dotSize, dotSize);
}

void randomise()
{
  dotX = random(width);
  dotY = random(height);
  
  if (dist(width/2, height/2, dotX, dotY) >= 95 &&
      dist(width/2, height/2, dotX, dotY) <= 200)
  {
    dotColor = blue;
  } else 
  {
    dotColor = green;
  }
}
