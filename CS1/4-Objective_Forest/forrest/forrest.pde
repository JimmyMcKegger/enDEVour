// forrest for the trees

class Tree 
{
 int x;
 int y;
 int trunkWidth;
 int trunkHeight;
 int topSize;
 color topColor;
 
 Tree(int newX, int newY, int w, int h, int s, color c)
 {
   this.x = newX;
   this.y = newY;
   this.trunkWidth = w;
   this.trunkHeight = h;
   this.topSize = s;
   this.topColor = c;
 }
}

final int numTrees = 12;
Tree[] forrest = new Tree[numTrees];

void setup()
{
  size(1120,500);
  initForrest(forrest);
}

void draw()
{
  drawTree(forrest);
}

void drawTree(Tree[] tf)
{  
  noStroke();
  
  int i = 0;
  while (i < numTrees)
  {
    // Trunk
    rectMode(CENTER);
    fill(142, 105, 74);
    rect(tf[i].x, tf[i].y-tf[i].trunkHeight/2, tf[i].trunkWidth, tf[i].trunkHeight);
    
    // Top
    ellipseMode(CENTER);
    fill(tf[i].topColor);
    ellipse(tf[i].x, tf[i].y-tf[i].trunkHeight, tf[i].topSize, tf[i].topSize);
    
    i++;
  }
}

void initForrest(Tree[] f)
{
  int offset = (width/numTrees)/2;
  int treeCounter = 0;
  while (treeCounter < numTrees)
  {
    int tx = treeCounter * width/numTrees + offset;
    int ty = int(random(height*0.6, height*0.8));
    int tw = int(random(15,30));
    int th = int(random(100,250));
    int ts = int(random(70,150));
    color tc = treeColor();
    
    f[treeCounter] = new Tree(tx, ty, tw, th, ts, tc);
    
    treeCounter++;
  }
}

// varying tree colors
color treeColor()
{
  color newColor = color(random(250), random(200,242), random(19));
  println(hex(newColor));
  return hex(int(newColor));
}
