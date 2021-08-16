int ballX = 300;
float ballY = 30;
int ballSize = 25;

int ballRed = 255;
int ballGreen = 50;
int ballBlue = 0;
color ballColor = color(ballRed, ballGreen, ballBlue);
int colorFrameCounter = 0;

float ballSpeed = 8.0;
float maxBallHeight = 500.00;

boolean falling = true;

void setup()
{
  size(600, 500);
}

void draw()
{
  background(255);
  ellipseMode(CENTER);
  
  // draw the ball
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
  
  //move
  motion();
}

void motion()
{
  // check if the ball is falling or not
  if (falling)
  {
    ballY += ballSpeed;
  } else
  {
    ballY -= ballSpeed;
  }    
  updateColor();
  bounce();
}

// check if the ball is hitting the top or bottom
void bounce()
{
  if (ballY + ballSize/2 >= height)
  {
    if (falling)
    {
      ballGreen += 40;
      updateColor();
    }
    falling = false;
  } else if (ballY - ballSize/2 < (height - maxBallHeight))
  {
    if (!falling)
    {
      maxBallHeight /= 2.0;
    }
    falling = true;
  }
  if (maxBallHeight < ballSize)
  {
    ballSpeed = 0;
    ballY = height - ballSize/2;
  }
}

void updateColor()
{
  // slowly change color
  colorFrameCounter++;
  if (colorFrameCounter >= 18)
  {
    ballRed -= 10;
    ballBlue += 15;
    ballColor = color(ballRed, ballGreen, ballBlue);
    colorFrameCounter = 0;
  }
}
