// Jack-o-lanterns
// question 2

final int pumpkinWidth = 89;
final int pumpkinHeight = 71;

class Pumpkin
{
  float x;
  float y;
  boolean jackOLantern;

  Pumpkin(float newX, float newY)
  {
    this.x = newX;
    this.y = newY;
    this.jackOLantern = false;
  }
}

final int numPumpkins = 13;
Pumpkin[] pumpkinPatch = new Pumpkin[numPumpkins];

int nose = 15;

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
       
  
  if (p.jackOLantern)
  {
    // lept eye
    fill(0);
    ellipse(p.x - pumpkinHeight/4, 
            p.y - pumpkinHeight/4, 
            pumpkinHeight/5, 
            pumpkinHeight/5);
          
    // right eye
    ellipse(p.x + pumpkinHeight/4, 
            p.y - pumpkinHeight/4, 
            pumpkinHeight/5, 
            pumpkinHeight/5);
    
    // nose
    triangle(p.x, // x1
             p.y - nose/2,// y1
             p.x - nose/2,// x2
             p.y + nose/3, // y2
             p.x + nose/2,// x3
             p.y + nose/3); // y3
    
    // mouth
    arc(p.x,
        p.y + pumpkinWidth/6,
        pumpkinWidth/2.5,
        pumpkinWidth/5,
        0,
        PI);
  }
}

// 
void mouseClicked()
{
  for (int i=0; i<numPumpkins; i++)
  {
    if (dist(mouseX, mouseY, pumpkinPatch[i].x, pumpkinPatch[i].y) < pumpkinWidth/2)
    {
      pumpkinPatch[i].jackOLantern = true;      
    }
  }
}
