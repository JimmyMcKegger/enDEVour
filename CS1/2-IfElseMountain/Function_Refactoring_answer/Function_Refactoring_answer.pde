/* Answer



*/

void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  
  // Circle 1
  drawCircle(50, 50, 100, color(180, 0, 0));
  // Circle 2
  drawCircle(275, 300, 200, color(50, 50, 0));
  // Circle 3
  drawCircle(350, 80, 140, color(0, 0, 195));
}

void drawCircle(int x, int y, float radius, color fillColor)
{
  for (int i = 0; i < 3; i += 1)
  {
    fill(fillColor);
    ellipse(x, y, radius, radius);
    //adjust the color for the next circle
    fillColor = color(red(fillColor) + 30, green(fillColor) + 30, blue(fillColor) + 30);
    //divide the radius in half for the next circle
    radius /= 2;
  }
}
