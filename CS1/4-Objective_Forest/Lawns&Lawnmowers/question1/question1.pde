// Lawns and Lawnmowers
// question 1

class Grass
{
  float x;
  float y;
  int gWidth;
  int gHeight;
  
  final color gColor = color(23, 132, 23);
}

Grass blade = new Grass();

void setup()
{
  size(400, 400);
  
  blade.x = width/2;
  blade.y = height/2;
  blade.gWidth = width/100;
  blade.gHeight = height/20;
}

void draw()
{
  background(247, 222, 178);
  drawGrass(blade);
}

void drawGrass(Grass bladeOfGrass)
{
  fill(bladeOfGrass.gColor);
  rect(bladeOfGrass.x, bladeOfGrass.y, bladeOfGrass.gWidth, bladeOfGrass.gHeight);
}
