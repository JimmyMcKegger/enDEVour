// Lawns and Lawnmowers
// question 2

class Grass
{
  float x;
  float y;
  int gWidth;
  int gHeight;
  color gColor;
}

int n = 50;
int m = 50;

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
      blades[counter][otherCounter].x = (width/n) * counter + 1;
      blades[counter][otherCounter].y = (height/m) * otherCounter + 1;
      blades[counter][otherCounter].gWidth = 4;
      blades[counter][otherCounter].gHeight = 10;
      blades[counter][otherCounter].gColor = color(23, 132, 23);
      
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
      fill(b[i][j].gColor); //<>//
      rect(b[i][j].x, b[i][j].y, b[i][j].gWidth, b[i][j].gHeight);
      
      j++;
    }
    i++;
  }
}
