// Jack-o-lanterns
// question 5

final int pumpkinWidth = 89;
final int pumpkinHeight = 71;

class Pumpkin
{
  float x;
  float y;
  boolean jackOLantern;
  boolean candle;

  Pumpkin(float newX, float newY, boolean f, boolean c)
  {
    this.x = newX;
    this.y = newY;
    this.jackOLantern = f;
    this.candle = c;
  }
}

final int numPumpkins = 7;
Pumpkin[] pumpkinPatch = new Pumpkin[numPumpkins];

int nose = 15;
color lit = color(243, 242, 18);

void setup()
{
  size(800, 600);
  background(0);
  smooth();
  
  initPumpkins(pumpkinPatch);
  
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
    // check if the candle is lit
    fill(p.candle ? lit : 0);
    
    // lept eye
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

void mouseClicked()
{
  for (int i=0; i<numPumpkins; i++)
  {
    if (dist(mouseX, mouseY, pumpkinPatch[i].x, pumpkinPatch[i].y) < pumpkinWidth/2)
    {
      if (pumpkinPatch[i].jackOLantern)
      {
        pumpkinPatch[i].candle = true;
      }
      pumpkinPatch[i].jackOLantern = true;      
    }
  }
}

void initPumpkins(Pumpkin[] patch)
{
  int i = 0;
  while (i < numPumpkins)
  {
    int offset = 10;
    int pumpkinX = i * width / numPumpkins + pumpkinWidth/2 + offset;
    int pumpkinY = height/3;
    
    patch[i] = new Pumpkin(pumpkinX, pumpkinY, random(2)<1 ? true:false, false);
    
   i++; 
  }
}
