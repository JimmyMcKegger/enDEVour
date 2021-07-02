void setup()
{
  size(800, 600);
  background(14, 54, 8);
  smooth();
}

void draw()
{
  happy(200, 150, 100);
  happy(400, 300, 200);
  happy(600, 450, 300);
}

void happy(int faceX, int faceY, int faceWidth)
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
  arc(faceX, faceY + 5, faceX/6, faceY/5, 0, PI);
}
