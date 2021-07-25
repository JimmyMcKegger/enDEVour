/* Answer

My "tripleCircle" function generalizes by defining the pattern for 
how to draw the three circles when given the details for the 
starting outer circle, and looping through the smaller, lighter colored circles.

This also hides the details of the rgb values, heights, and widths of the smaller circles
as well as cutting down on the repetition of specifying all of the different fill colors and 
ellipsis/circle widths in the draw() function. 

*/

void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  
  // Circle 1
  tripleCircle(50, 50, 100, color(180, 0, 0));
  // Circle 2
  tripleCircle(275, 300, 200, color(50, 50, 0));
  // Circle 3
  tripleCircle(350, 80, 140, color(0, 0, 195));
}

void tripleCircle(int x, int y, int radius, color fillColor)
{
  for (int i = 0; i < 3; i += 1)
  {
    // Draw the circle
    fill(fillColor);
    ellipse(x, y, radius, radius);
    
    // Adjust the color for the next circle
    fillColor = color(red(fillColor) + 30, green(fillColor) + 30, blue(fillColor) + 30);
    // Divide the radius in half for the next circle
    radius /= 2;
  }
}
