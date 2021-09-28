//turtle code 

PImage cleanTurtle;
PImage halfTurtle;
PImage dirtyTurtle;
PImage waterCan;

float turtleX = 100;
float turtleY = 100;
int turtleSize = 150;
final float turtleSpeed = 7.5;
float turtleDirection = 10;

int mudPuddleX = 500;
int mudPuddleY = 500;
int mudPuddleWidth = 150;
int mudPuddleHeight = 80;

int waterPuddleX = 300;
int waterPuddleY = 150;
int waterPuddleWidth = 150;
int waterPuddleHeight = 80;

final int turtleStateClean = 1;
final int turtleStateHalf = 2;
final int turtleStateDirty = 3;
int turtleState;
boolean setHalf = false;
 

void setup()
{
  size(800, 700);
  ellipseMode(CENTER);
  cleanTurtle = loadImage("turtle.png");
  halfTurtle = loadImage("turtleHalf.png");
  dirtyTurtle = loadImage("turtleDirty.png");
  waterCan = loadImage("wateringcan.png");
  
  imageMode(CENTER);
  turtleState = turtleStateClean;
}

void draw()
{
  background(255);
  cursor(waterCan);
  mudPuddle();
  waterPuddle();
  updateTurtle();
  drawTurtle();
  moveTurtle();
}

void updateTurtle()
{
  if (dist(turtleX, turtleY, mudPuddleX, mudPuddleY) < turtleSize/2)
  {
    turtleState = turtleStateDirty;
  }
  else if (dist(turtleX, turtleY, waterPuddleX, waterPuddleY) < turtleSize/2)
  {
    turtleState = turtleStateClean;
  }
  
  if (turtleState == turtleStateClean)
  {
    if (dist(turtleX, turtleY, mudPuddleX, mudPuddleY) < turtleSize/2)
    {
      turtleState = turtleStateDirty;
    }
  }
  else if (turtleState == turtleStateHalf)
  {
    if (!mousePressed)
    {
      setHalf = true;
    }

    else if (dist(mouseX, mouseY, turtleX, turtleY) < turtleSize/2 &&
                  mousePressed &&
                  setHalf)
      {
        turtleState = turtleStateClean;
        setHalf = false;
      }
    }

  else if (turtleState == turtleStateDirty)
  {
    if (dist(mouseX, mouseY, turtleX, turtleY) < turtleSize/2 &&
            mousePressed)
          {
            turtleState = turtleStateHalf;
          }
  }
  
}

void drawTurtle()
{
  if (turtleState == turtleStateClean)
  {
    image(cleanTurtle, turtleX, turtleY);
  }
  else if(turtleState == turtleStateHalf)
  {
    image(halfTurtle, turtleX, turtleY);
  }
  else if (turtleState == turtleStateDirty)
  {
    image(dirtyTurtle, turtleX, turtleY);
  }
}

void moveTurtle()
{
    float nextX = turtleX + int(turtleSpeed/turtleState * cos(turtleDirection));
    float nextY = turtleY + int(turtleSpeed/turtleState * sin(turtleDirection));
    
    float crossProduct = (nextX - turtleX)*(mouseY - turtleY) -
                        (nextY - turtleY)*(mouseX - turtleX);
  
    if (dist(nextX, nextY, mouseX, mouseY) > turtleSize/4)
    {
      turtleX = nextX;  
      turtleY = nextY;
    }
    //turtleDirection = atan2(mouseY - turtleY, mouseX - turtleX);
    
    if (random(1) < 0.07)
    {
      final int angleToTurn = 30;
      if (crossProduct < 0)
      {
        turtleDirection -= radians(angleToTurn 
                          + random(angleToTurn/4) 
                          - angleToTurn/8);
      }
      else
      {
        turtleDirection += radians(angleToTurn 
                          + random(angleToTurn/4.0f) 
                          - angleToTurn/8.0f);
      }
    }
}

void mudPuddle()
{
  fill(123, 63, 0);
  ellipse(mudPuddleX, mudPuddleY, mudPuddleWidth, mudPuddleHeight);
}

void waterPuddle()
{
  fill(0, 0, 200);
  ellipse(waterPuddleX, waterPuddleY, waterPuddleWidth, waterPuddleHeight);
}
