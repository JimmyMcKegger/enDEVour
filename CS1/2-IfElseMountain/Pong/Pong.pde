//Pong

void setup()
{
  size(700, 500);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

//pong variables
final float padWidth = 20;
final float padHeight = 110;
final color padColor = color(70, 250, 22);

final float pad1X = padWidth/2 + 10;;
float pad1Y = 200;

final float pad2X = 700 - padWidth/2 - 10;
float pad2Y = 200;

float ballX = 75;
float ballY = 200;
float ballSize = 30;
final color ballColor = color(3, 49, 252);

float speed = 10;
float elevation = 1;
boolean begin = false;
boolean win;
boolean lose;

float aiSpeed = 9;

void draw()
{
  if (win)
  {
    you_win();
  } else if (lose)
  {
    you_lose();
  } else {
    play();
  }
}

void play()  //<>//
{
    background(0);
    stroke(128);
    strokeWeight(4);
    line(width/2, 0, width/2, height);
    strokeWeight(1);
  
    gamePieces();
  if (!begin)
  {
    delay(1000);
    begin = true;
  }
  
  ballX += speed;
  ballY += speed * elevation;
  
  // paddle bounces checkers
  if (ballX + ballSize/2 <= pad2X + padWidth/2 &&
      ballX + ballSize/2 >= pad2X - padWidth/2 &&
      ballY <= pad2Y + padHeight/2 &&
      ballY >= pad2Y - padHeight/2)
      {
        speed *= -1;
        elevation *= -1;
        ballX -= 10;
      } else if (ballX - ballSize/2 <= pad1X + padWidth/2 &&
                 ballX - ballSize/2 >= pad1X - padWidth/2 &&
                 ballY <= pad1Y + padHeight/2 &&
                 ballY >= pad1Y - padHeight/2)
      {
        speed *= -1; //<>//
        elevation *= -1;
        ballX += 5;
      }
      
    // edge bounce checkers
    if (ballY + ballSize/2 <= 1)
    {
      elevation *= -1;
    } else if (ballY - ballSize/2 >= 499)
    {
      elevation *= -1;
    }

  //score checkers
  if (ballX + ballSize/2 >= 700)
  {
    win = true;
  } else if (ballX - ballSize/2 <= 0)
  {
    lose = true;
  }
  //move
  pad1Y = mouseY;
  
  //AI
  if (ballY > pad2Y + 10)
  {
    pad2Y += aiSpeed;
  } else if (ballY < pad2Y - 10)
  {
    pad2Y -= aiSpeed;
  }
}

  void gamePieces()
{
  fill(padColor);
  rect(pad1X, pad1Y, padWidth, padHeight);
  rect(pad2X, pad2Y, padWidth, padHeight);
  
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void you_win() //<>//
{
    fill(0, 255, 0);
    rect(width/2, height/2, 300, 140);
    fill(0);
    textSize(60);
    text("You Win!", width/2 - 100, height/2 + 20);
}
void you_lose()
{
    fill(255, 0, 0);
    rect(width/2, height/2, 300, 140);
    fill(0);
    textSize(60);
    text("You Lose", width/2 - 100, height/2 + 20);
}
