// Lawns and Lawnmowers
// question 6
// Adding the lawnmower

class Grass
{
  float x;
  float y;
  int gWidth;
  float gHeight;
  color gColor;
  
  final float maxHeight = 30;
}

class Lawnmower
{
  int x;
  int y;
}

PImage mower;

int n = 150;
int m = 150;

int timer;

Grass[][] blades = new Grass[n][m];
Lawnmower l = new Lawnmower();

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
      blades[counter][otherCounter].gWidth = 2;
      blades[counter][otherCounter].gHeight = 0;
      blades[counter][otherCounter].gColor = color(0, random(100,250), 0);
      
      otherCounter++;
    }
    counter++;
  }
  timer = 0;
  
  // image from openclipart.org
  mower = loadImage("mower.png");
}

void draw()
{
  background(247, 222, 178);
  drawGrass(blades);
  grow(blades);
  
  cursor(mower);
  updateLawnmower(l);
  cut(blades);
}

void drawGrass(Grass b[][])
{
  int i = 0;
  while (i < n)
  {
    int j = 0;
    while (j < m)
    {
      noStroke();
      fill(b[i][j].gColor);
      rect(b[i][j].x, b[i][j].y, b[i][j].gWidth, b[i][j].gHeight);
      
      j++;
    }
    i++;
  }
}

void grow(Grass b[][])
{
  if (timer % 15 == 0)
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

// offsetting the lawnmower's blades
void updateLawnmower(Lawnmower uL)
{
  uL.x = mouseX + 25;
  uL.y = mouseY + 35;
}

// cut the grass if it's under the mower
void cut(Grass b[][])
{
  int i = 0;
  while (i < n)
  {
    int j = 0;
    while (j < m)
    {
      if (dist(l.x, l.y, blades[i][j].x, blades[i][j].y) < 30)
      {
        blades[i][j].gHeight = 5;
      }
      j++;
    }
    i++;
  } 
}

// click to reset the grass
void mouseClicked()
{
  for (int i=0; i<n; i++) //<>//
  {
    for (int j=0; j<m; j++)
    {
      blades[i][j].gHeight = 0;
    }
  }
}
