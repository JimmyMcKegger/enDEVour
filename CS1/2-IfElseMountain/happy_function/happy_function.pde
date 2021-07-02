void setup()
{
  size(500, 350);
  background(14, 54, 8);
  smooth();
}

void draw()
{
  happy();
}

// happy face location
int faceX = 250;
int faceY = 175;
int faceWidth = 200;

void happy()
{
  //face
  strokeWeight(2);
  fill(227, 219, 0);
  circle(faceX, faceY, faceWidth/2);
  
  //eyes
  fill(0);
  circle(faceX - faceWidth/10, faceY - faceWidth/10, faceWidth/10);
  circle(faceX + faceWidth/10, faceY - faceWidth/10, faceWidth/10);
  
  // mouth
  arc(faceX, faceY + 5,50,50,0,PI);
}
