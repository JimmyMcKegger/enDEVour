// also solved question 3 while working on 2

size(500,500);
background(255);

class Ball
{
  int x;
  int y;
  int size;
  int num;

  Ball(int newX, int newY, int newSize, int newN)
  {
    this.x = newX;
    this.y = newY;
    this.size = newSize;
    this.num = newN;
  }
}
////
// Define the ball's properties

Ball[] balls = new Ball[5];

////
// Create 5 balls

int ballNum = 0;
while (ballNum < balls.length)
{
  
  int bX = (int)random(20, width-20);
  int bY = (int)random(20, height-20);
  int bS = (int)random(20, 100);
 
  balls[ballNum] = new Ball(bX, bY, bS, ballNum + 1);

  
  ballNum++;
}


////
// Sort the balls by size



ballNum = 0;
int[] sizes;
while (ballNum < balls.length)
{
  int[] sizes = balls[ballNum].size 
  ballNum++;
}


////
// Draw the array of balls (reuse ballNum variable)

textAlign(CENTER, CENTER);

ballNum = 0;
while (ballNum < balls.length)
{
  fill(200);
  ellipse(balls[ballNum].x, balls[ballNum].y, 
          balls[ballNum].size, balls[ballNum].size);

  fill(0);
  text(balls[ballNum].num, balls[ballNum].x, balls[ballNum].y);
  
  ballNum++;
}
