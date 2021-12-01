// Lawns and Lawnmowers
// question 5
// growing grass

class Grass
{
  float x;
  float y;
  int gWidth;
  float gHeight;
  color gColor;
  
  final float maxHeight = 30;
}

int n = 100;
int m = 100;

int timer;

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
      blades[counter][otherCounter].gHeight = 0;
      blades[counter][otherCounter].gColor = color(0, random(100,250), 0);
      
      otherCounter++;
    }
    counter++;
  }
  timer = 0;
}

void draw()
{
  background(247, 222, 178);
  drawGrass(blades);
  grow(blades);
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

void grow(Grass b[][])
{
  if (timer % 5 == 0)
  {
    int i = 0;
    while (i < n)
    {
      int j = 0;
      while (j < m)
      {
        if (blades[i][j].gHeight < blades[i][j].maxHeight)
        {
          blades[i][j].gHeight++;
        }
        j++;
      }
      i++;
    }
  }
  timer++;
}

// click to reset the grass
void mouseClicked()
{
  for (int i=0; i<n; i++)
  {
    for (int j=0; j<m; j++)
    {
      blades[i][j].gHeight = 0;
    }
  }
}
