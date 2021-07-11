void setup()
{
  size(900, 900);
  background(217, 234, 210);
}

void draw()
{
  ellipseMode(CENTER);
  
  goldilocks();
  
  //left bear
  bear(width/6, height*0.66);
  //middle bear
  bear(width/2, height*0.66);
  //right bear
  bear(width/1.2, height*0.66);
  
  //print("spriteHeight: " + spriteHeight + "\n");
  //print("Width: " + width + "\n");
  //print("Height: " + height + "\n");
}

  void mouseClicked() 
{
  print("pixel: " + mouseX + ", " + mouseY + "\n");
}


void goldilocks()
{
  float goldiHeight = height/3;
  float goldiWidth = goldiHeight/2;
  
  //position of goldilocks
  float goldiX = width/2;
  float goldiY = height/4;
  
  //head
  fill(255, 193, 236);
  ellipse(goldiX, goldiY, goldiHeight/3, goldiWidth/2);
  
  //body
  fill(224, 62, 221);
  //TODO: turn the coordinates below into variables
  triangle(448, //x1
          264, //y1
          405, //x2
          363, //y2
          499, //x3
          373); //y3
}

void bear(float bearX, float bearY)
{
  //make the bears brown
  fill(132, 81, 33);
  
  //set bear sizes
  float bearHeight = height/3;
  float bearWidth = bearHeight/2;
  
  
  //body
  ellipse(bearX, bearY, bearWidth, bearHeight/1.5);
  //head
  //ellipse()
  //ears
  //circle()
  //circle()
}
