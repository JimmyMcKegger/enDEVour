// Practice Drawing With While Loops
// Question 2

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  barCode();
}

void barCode()
{
  int n = 50;
  int i = 0;
  float barWidth = width/n;
  
  while (i <= n)
  {
    // find the x coordinates
    float x1 = i * barWidth;
    float x2 = x1 + barWidth;
    
    // set the color
    if (i % 2 == 0)
    {
      fill(0);
    }
    else
    {
      fill(255);
    }
    
    //draw the bar
    rect(x1, 0, x2, height);
    
    i += 1;
  }
}
