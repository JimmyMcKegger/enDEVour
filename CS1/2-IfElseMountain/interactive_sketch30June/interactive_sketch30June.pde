// interactive painting with red green and blue

final color redColor = color(240,0,0);
final color greenColor = color(0,240,0);
final color blueColor = color(0,0,240);
final color blank = color(255);

color currentColor;

final int paintRadius = 5;

void setup()
{
  size(500, 500);
  background(255);
  
  noStroke();
  
  currentColor = redColor;
  
}
void draw()
{

}

void keyPressed()
{
  //pick a color
  switch(key)
  {
    case 'r':
      currentColor = redColor;
      break;
    case 'g':
      currentColor = greenColor;
      break;
    case 'b':
      currentColor = blueColor;
      break;
    default:
      currentColor = blank;
      break;
  }
 
}

void mouseDragged()
{
  fill(currentColor);
  ellipse(mouseX, mouseY, paintRadius, paintRadius);
}
