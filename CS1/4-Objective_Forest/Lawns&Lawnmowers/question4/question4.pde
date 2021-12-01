// Lawns and Lawnmowers
// question 4

class Grass
{
  float x;
  float y;
  int gWidth;
  float gHeight;
  color gColor;
}

int n = 100;
int m = 100;

Grass[][] blades = new Grass[n][m];

void setup()
{
  size(800, 800);
  
  int counter = 0;
  while (counter < n)
  {
    int otherCounter = 0;
    while (otherCounter < m)
    {
      blades[counter][otherCounter] = new Grass();
      blades[counter][otherCounter].x = random(width);
      blades[counter][otherCounter].y = random(height);
      blades[counter][otherCounter].gWidth = 4;
      blades[counter][otherCounter].gHeight = random(5,25);
      blades[counter][otherCounter].gColor = color(0, random(100,250), 0);
      
      otherCounter++;
    }
    counter++;
  }
}

void draw()
{
  background(247, 222, 178);
  drawGrass(blades);
}

void drawGrass(Grass b[][])
{
  int i = 0;
  while (i < n)
  {
    int j = 0;
    while (j < m)
    {
      fill(b[i][j].gColor);
      rect(b[i][j].x, b[i][j].y, b[i][j].gWidth, b[i][j].gHeight);
      
      j++;
    }
    i++;
  }
}
