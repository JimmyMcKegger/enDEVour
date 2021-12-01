// Jack-o-lanterns
// question 1

final int pumpkinWidth = 89;
final int pumpkinHeight = 71;

class Pumpkin
{
  float x;
  float y;

  Pumpkin(float newX, float newY)
  {
    x = newX;
    y = newY;
  }
}

final int numPumpkins = 13;
Pumpkin[] pumpkinPatch = new Pumpkin[numPumpkins];

void setup()
{
  size(800, 600);
  background(0);
  smooth();
  
  int i = 0;
  while (i < numPumpkins)
  {
    pumpkinPatch[i] = new Pumpkin(random(pumpkinWidth/2, width-pumpkinWidth/2), // x
                                  random(pumpkinHeight/2, height-pumpkinHeight/2)); // y)
    
   i++; 
  }
}

void draw()
{
  for (int i=0; i < numPumpkins; i++)
  {
    drawPumpkin(pumpkinPatch[i]);
  }
}

void drawPumpkin(Pumpkin p)
{
  fill(232, 117, 23);
  ellipse(p.x, p.y, pumpkinWidth, pumpkinHeight);

  fill(0, 120, 0);
  quad(p.x - 3, p.y - pumpkinHeight/2 + 5, 
       p.x - 5, p.y - pumpkinHeight/2 - 5, 
       p.x + 5, p.y - pumpkinHeight/2 - 5, 
       p.x + 3, p.y - pumpkinHeight/2 + 5);
}
