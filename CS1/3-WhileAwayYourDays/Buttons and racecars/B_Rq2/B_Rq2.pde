// Parallel Arrays for Buttons and Racecars
// question 2

int n = 10; //number of racecars

int[] carX = new int[n];
int[] carY = new int[n];
color[] carColor = new color[n];
int carWidth;
int carHeight;
int spacing = 3;

int[] speed = new int[n];
int speedUpdater = 0;

int finishLineX;
int finishLineWidth;
color finishLineColor = color(255, 0, 0);

boolean winner = false;
int first;

void setup() 
{
  size(1200, 600);
  carWidth = width/20;
  carHeight = int((height/n)*0.7);
  finishLineWidth = width/40;
  finishLineX = width - finishLineWidth * 2;

  int starter = 0;
  while (starter < n)
  {
    carX[starter] = 5;
    carY[starter] = (starter*height/n) + spacing;
    carColor[starter] = randomColor();   
    speed[starter] = randomSpeed();
    starter++;
  }
}

void draw()
{
  if (winner) 
  {
    win();
  }
  else
  {
    background(255);
    fill(finishLineColor);
    rect(finishLineX, 0, finishLineWidth, height);
    int i = 0;
    while (i < n)
    {
      fill(carColor[i]);
      rect(carX[i], carY[i], carWidth, carHeight);
      fill(0);
      textSize(20);
      text(i, carX[i] + carWidth/2.5, carY[i] + carHeight/1.5);
      i++;
    }
    
    //check for a winner
    int w = 0;
    while (w < n)
    {
      if (carX[w] + carWidth > finishLineX)
      {
        winner = true;
        first = w;
      }
      w++;
    }
    updateCars(); //<>//
  }
}

void updateCars()
{
  int u = 0;
  while (u < n)
  {
    carX[u] = carX[u] + speed[u];
    if (speedUpdater >= 30)
    {
      speed[u] = randomSpeed();
      speedUpdater = 0;
    }
    else 
    {
      speedUpdater++;
    }
    u++;
  }
}

color randomColor()
{ 
  return color(random(255), random(255), random(255));
}

int randomSpeed()
{
  return int(random(4, 8));
}

void win()
{
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(width/2, height/2, 300, 140);
  fill(0);
  textSize(60);
  text(first + " wins!", width/2 - 100, height/2 + 20);
}
