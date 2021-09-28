//sheepState

PImage sheepImage;
PImage sheepTeaImage;

int sheepX;
int sheepY;
float sheepDirection; // in radians
final int sheepSpeed = 3;

final int sheepStateWander = 1;
final int sheepStateStop = 2;
final int sheepStateColors = 3;
boolean fillRed = true;
int sheepState;

final int sheepMouseThreshold = 50;
final int circleShift = 40;

final color[] listOfColors = 
{
  color(227, 41, 41), //red
  color(255, 165, 0), //orange
  color(252, 255, 95), //yellow
  color(50, 200, 60), //green
  color(115, 111, 234), // blue
  color(75, 0, 130), //indigo
  color(216, 191, 216)//violet
};
  
final int numFramesToShiftColor = 10;
int colorStartIndex;

void setup()
{
  size(500,500);
  
  sheepImage = loadImage("lemmling_Cartoon_sheep.png");
  sheepTeaImage = loadImage("Teeschaf.png");
  imageMode(CENTER);
  
  sheepX = width/2;
  sheepY = height/2;
  sheepDirection = 30;
  sheepState = sheepStateWander;
  
  colorStartIndex = 0;
}

void draw()
{
  background(255);
  updateSheepState();
  drawSheep();
  moveSheep();
}

void updateSheepState()
{
  if (sheepState == sheepStateWander)
  {
    if (dist(mouseX, mouseY, sheepX, sheepY) < sheepMouseThreshold)
    {
      sheepState = sheepStateStop;
    }
  }
  else if (sheepState == sheepStateStop)
  {
    if (dist(mouseX, mouseY, sheepX, sheepY) >= sheepMouseThreshold)
    {
      sheepState = sheepStateWander;
    }
    else if (mousePressed)
    {
      sheepState = sheepStateColors;
      frameRate(5);
    }
  }
  else if (sheepState == sheepStateColors)
  {
    if (!mousePressed)
    {
      sheepState = sheepStateStop;
      frameRate(60);

    }
    else if (frameCount % numFramesToShiftColor == 0)
    {
       colorStartIndex =colorStartIndex + 1;
       if (colorStartIndex >= listOfColors.length)
       {
         colorStartIndex = 0;
       }
    }
  }
}

// This function draws the sheep based on its current
// state.
void drawSheep()
{
  if (sheepState == sheepStateWander)
  {
    image(sheepImage, sheepX, sheepY);
  }
  else 
  {
    if (sheepState == sheepStateColors)
    {
      drawRings(sheepX, sheepY, circleShift, listOfColors, colorStartIndex);
    }
    
    image(sheepTeaImage, sheepX, sheepY);
  }
}


void moveSheep()
{
  if (sheepState == sheepStateWander)
  {
    int nextX = sheepX + int(sheepSpeed * cos(sheepDirection));
    int nextY = sheepY + int(sheepSpeed * sin(sheepDirection));
    
    int crossProduct = (nextX - sheepX)*(mouseY - sheepY) -
                        (nextY - sheepY)*(mouseX - sheepX);
  
    if (dist(nextX, nextY, mouseX, mouseY) > sheepImage.width/4)
    {
      sheepX = nextX;  
      sheepY = nextY;
    }
    
    //sheepDirection = atan2(mouseY - sheepY, mouseX - sheepX);
    if (random(1) < 0.05)
    {
      final int angleToTurn = 30;
      if (crossProduct < 0)
      {
        sheepDirection -= radians(angleToTurn 
                          + random(angleToTurn/4) 
                          - angleToTurn/8);
      }
      else
      {
        sheepDirection += radians(angleToTurn 
                          + random(angleToTurn/4.0f) 
                          - angleToTurn/8.0f);
      }
    }
  }
}

void drawRings(int x, int y, int radiusChange, color[] colors, int startIndex)
{
  float maxDistance = max(dist(x, y, 0, 0), dist(x, y, 0, height));
  maxDistance = max(maxDistance, dist(x, y, width, 0));
  maxDistance = max(maxDistance, dist(x, y, width, height));
  
  float radius = maxDistance;
  int colorIndex = 0;
  while (radius > 0)
  {
    fill(colors[colorIndex]);
    colorIndex = (colorIndex + 1);
    if (colorIndex >= colors.length)
    {
      colorIndex = 0; //reset
    }
    ellipse(x, y, 2*radius, 2*radius);
    radius -= radiusChange;
  }
  
}

void keyPressed() 
{
  if (key == 'q') 
  {
  exit();  
  } 
}
