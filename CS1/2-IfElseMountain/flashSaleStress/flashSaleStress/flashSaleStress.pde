//Flash sale stress

//background
final color skyBlue = color(68, 183, 240);
final color grassGreen = color(40, 200, 40);

final color sunYellow = color(255, 255, 100);
final float sunWeight = 1.4;
final float sunX = 80;
final float sunY = 80;
final float sunSize = 100;

final color cartColor = color(175, 70, 240);
final float cartX = 380;
final float cartY = 305;
final float cartWidth = 60;
final float cartHeight = 150;
final float wheelX = cartX - cartWidth/2.5;
final float wheelY = cartY + cartHeight/2;
final float wheelSize = cartWidth / 2;

//merchant 
float merchX = cartX - 100;
float merchY = cartY - 50;
color shirtColor = color(240, 60, 60);
color merchantFace = color(250, 240, 230);
final float merchHeight = cartHeight + 50;
final float merchWidth = cartWidth;

//balloons
float balloonWidth = 25;
float balloonHeight = 45;
float[] ballX = 
{
  cartX, 
  cartX + balloonWidth, 
  cartX - balloonWidth,
  cartX + balloonWidth * 2,
  cartX - balloonWidth * 2, 
  cartX + balloonWidth * 3,
  cartX - balloonWidth * 3,
  cartX + balloonWidth * 4,
  cartX - balloonWidth * 4,
};
color[] ballColors = 
{
  randomColor(),
  randomColor(),
  randomColor(),
  randomColor(),
  randomColor(),
  randomColor(),
  randomColor(),
  randomColor(),
  randomColor(),
};
int ballPointer = 0;
boolean start = false;

void setup() 
{
  size(600, 400);
  ellipseMode(CENTER);
}

void draw()
{
  //sky
  background(skyBlue);
  
  //grass
  noStroke();
  fill(grassGreen);
  rectMode(CORNER);
  rect(0, 330, 610, 200);
  
  //sun
  strokeWeight(sunWeight);
  fill(sunYellow);
  circle(sunX, sunY, sunSize);
  
  cart();
  merchant();
  balloons();
}

void cart()
{
  //baloon cart
  stroke(0);
  fill(cartColor);
  rectMode(CENTER);
  rect(cartX, cartY, cartWidth, cartHeight);
  
  //wheel
  ellipseMode(CENTER);
  strokeWeight(2.5);
  noFill();
  ellipse(wheelX, wheelY - 5, wheelSize, wheelSize);
  strokeWeight(2);
  line(wheelX, wheelY - wheelSize/2 - 5, wheelX, wheelY + wheelSize/2 - 5);
  line(wheelX - wheelSize/2, wheelY - 5, wheelX + wheelSize/2, wheelY - 5);
}

void merchant()
{
  //head
  fill(merchantFace);
  ellipse(merchX, merchY - merchHeight/5, merchWidth/2, merchHeight/3);
  //eyes
  fill(0);
  ellipse(merchX - 5, merchY - merchHeight/3.6, 3, 4);
  ellipse(merchX + 5, merchY - merchHeight/3.6, 3, 4);
  //mouth
  curve(273, 224, 280, 232, 280, 232, 284, 224);
  //body
  fill(shirtColor);
  ellipse(merchX, merchY + merchHeight/5, merchWidth, merchHeight/2);
  //legs
  line(merchX + 10, merchY + merchHeight/2.3, merchX + 10, height);
  line(merchX - 10, merchY + merchHeight/2.3, merchX - 10, height);
  //arms
  //line(merchX + 10, merchY + merchHeight/2.3, merchX + 10, height);
  //line(merchX - 10, merchY + merchHeight/2.3, merchX - 10, height);
}

void balloons()
{
    for (int i = 0; i < ballPointer; i += 1)
    {
      noStroke();
      fill(ballColors[i]);
      ellipse(ballX[i], height/3, balloonWidth, balloonHeight);
      stroke(0);
      strokeWeight(0.5);
      line(ballX[i], height/3 + balloonHeight/2, cartX, cartY - cartHeight/2);
    }
}

void mouseClicked() 
{
  //add a balloon if you click on the cart
  if (mouseX >= cartX - cartWidth/2 &&
      mouseX <= cartX + cartWidth/2 &&
      mouseY >= cartY - cartHeight/2 &&
      mouseY <= cartY + cartHeight/2 &&
      ballPointer < ballX.length)
  {
     ballPointer += 1;
  }
     
  //pop a balloon if you click on the sun
  if (dist(sunX, sunY, mouseX, mouseY) < sunSize/2 &&
      ballPointer > 0)
  {
    ballPointer -= 1;
    merchantFace = color(red(merchantFace) + 10, green(merchantFace) - 10, blue(merchantFace) -10);
    //reassign the balloon's color
    ballColors[ballPointer] = randomColor();
  }
}

//function to generate random colours
color randomColor()
{ 
  return color(random(255), random(255), random(255));
}
