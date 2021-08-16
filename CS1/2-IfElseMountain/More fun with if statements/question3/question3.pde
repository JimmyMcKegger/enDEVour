// circle dragger

final int circleSize = 100;
int circleX;
int circleY;
PImage logo;

void setup()
{
  size(500, 400);

  ellipseMode(CENTER);
  imageMode(CENTER);

  circleX = width/2;
  circleY = height/2;

  logo = loadImage("shopify_glyph.png");
  logo.resize((int)(0.6*circleSize), 0);
}

void draw()
{
  background(240);
  
  fill(200);
  noStroke();
  ellipse(circleX, circleY, circleSize, circleSize);
  
  image(logo, circleX, circleY);
}

void mouseDragged()
{

  if((mouseX - circleSize / 2) > 0 &&
     (mouseX + circleSize / 2) < width &&
     (mouseY - circleSize / 2) > 0 &&
     (mouseY + circleSize / 2) < height)
  {
    circleX = mouseX;
    circleY = mouseY;
  }
}
