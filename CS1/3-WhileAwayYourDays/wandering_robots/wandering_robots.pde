//Wandering robots

// Instructions: use the mouse to drag the beacon

final int robotSpeed = 3;
final int robotMouseThreshold = 50;

int robot1X;
int robot1Y;
float robot1Direction;
int robot1TimeOfBeacon = -1;

int robot2X;
int robot2Y;
float robot2Direction;
int robot2TimeOfBeacon = -1;

int robotDiameter = 20;

int beaconX;
int beaconY;
int beaconDiameter = 30;
boolean beaconDragged = false;

void setup()
{
  size(500,500); 
  ellipseMode(CENTER);
 
  robot1X = 50;
  robot1Y = 50;
  robot1Direction = 0;
  
  robot2X = 250;
  robot2Y = 250;
  robot2Direction = 0;
  
  beaconX = 150;
  beaconY = 150;
}

void draw()
{
  background(255);
  
  drawRobot(robot1X, robot1Y, robot1Direction, robotDiameter);
  drawRobot(robot2X, robot2Y, robot2Direction, robotDiameter);
  
  drawBeacon();  
  
  if (robot1TimeOfBeacon < 0 || millis() - robot1TimeOfBeacon > 3000)
    {
      moveRobot1();
    }
  if (robot2TimeOfBeacon < 0 || millis() - robot2TimeOfBeacon > 3000)
    {
      moveRobot2(); //<>//
    }
}

void drawRobot(int x, int y, float dir, int diam)
{
  noFill();
  ellipse(x, y, diam, diam);
  
  //set the line's end coordinates pointing to the beacon
  float lineX = x + diam/2 * cos(dir);
  float lineY = y + diam/2 * sin(dir); 
  line(x, y, lineX, lineY);
}

void drawBeacon()
{
  fill(128);
  ellipse(beaconX, beaconY, beaconDiameter, beaconDiameter);
}


void moveRobot1()
{
  int nextX = robot1X + int(robotSpeed * cos(robot1Direction));
  int nextY = robot1Y + int(robotSpeed * sin(robot1Direction));
  
  int crossProduct = (nextX - robot1X)*(beaconY - robot1Y) -
                      (nextY - robot1Y)*(beaconX - robot1X);

  if (dist(nextX, nextY, beaconX, beaconY) > robotDiameter/2)
  {
    robot1X = nextX;  
    robot1Y = nextY;
  }
  else //make the robot wait 3 seconds
  {
    robot1TimeOfBeacon += 3000;
  }
  
  if (random(1) < 0.05)
  {
    final int angleToTurn = 30;
    if (crossProduct < 0)
    {
      robot1Direction -= radians(angleToTurn 
                        + random(angleToTurn/4) 
                        - angleToTurn/8);
    }
    else
    {
      robot1Direction += radians(angleToTurn 
                        + random(angleToTurn/4.0f) 
                        - angleToTurn/8.0f);
    }
  }
}

void moveRobot2()
{
  int nextX = robot2X + int(robotSpeed * cos(robot2Direction));
  int nextY = robot2Y + int(robotSpeed * sin(robot2Direction));
  
  int crossProduct = (nextX - robot2X)*(beaconY - robot2Y) -
                      (nextY - robot2Y)*(beaconX - robot2X);
  
  if (dist(nextX, nextY, beaconX, beaconY) > robotDiameter/2)
  {
    robot2X = nextX;  
    robot2Y = nextY;
  }
  else
  {
    robot2TimeOfBeacon += 3000;
  }
  
  if (random(1) < 0.05)
  {
    final int angleToTurn = 45;
    if (crossProduct < 0)
    {
      robot2Direction -= radians(angleToTurn 
                        + random(angleToTurn/4) 
                        - angleToTurn/8);
    }
    else
    {
      robot2Direction += radians(angleToTurn 
                        + random(angleToTurn/4.0f) 
                        - angleToTurn/8.0f);
    }
  }
}

int getCrossProduct(int nextX, int nextY, int robotX, int robotY)
{
  return (nextX - robotX)*(beaconY - robotY) -
         (nextY - robotY)*(beaconX - robotX);
}

float getAngleToTurn(int crossProduct)
{
  final int angleToTurn = 45;
  if (random(1) < 0.05)
  {
    float angleToTurnWithRandomness = 
        radians(angleToTurn + random(angleToTurn/4.0f)  - angleToTurn/8.0f);
        
    if (crossProduct < 0)
    {
      return -angleToTurnWithRandomness;
    }
    else
    {
      return angleToTurnWithRandomness;
    }
  }
  return 0;
}

void mouseDragged()
{
   if ((mouseX - beaconDiameter / 2) > 0 &&
       (mouseX + beaconDiameter / 2) < width &&
       (mouseY - beaconDiameter / 2) > 0 &&
       (mouseY + beaconDiameter / 2) < height)
  {
    beaconX = mouseX;
    beaconY = mouseY;
  }
}
