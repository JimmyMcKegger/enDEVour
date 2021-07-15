void setup()
{
  size(375, 300);
  background(217, 234, 210);
}

void draw()
{
  ellipseMode(CENTER);
  
  goldilocks();
  
  //left bear
  bear(width/6, height*0.722);
  //middle bear
  bear(width/2, height*0.722);
  //right bear
  bear(width/1.2, height*0.722);
}

void goldilocks()
{
  //set the size of goldilocks
  float gHeight = height/3;
  float gWidth = width/5;
  
  //point at the central position of goldilocks
  float gX = width/2;
  float gY = height*0.277;
  
  //body
  fill(224, 62, 221);
  triangle(gX, //x1
          gY - gHeight/8, //y1
          gX - gWidth/2.5, //x2
          gY + gHeight/2, //y2
          gX + gWidth/2.5, //x3
          gY + gHeight/2); //y3
          
  //head
  fill(253, 229, 204);
  ellipse(gX, gY - gHeight/4, gWidth/2 , gHeight/2 - gHeight/10);
}

void bear(float bearX, float bearY)
{
  //set the size of the bears
  float bHeight = height/3;
  float bWidth = width/5;
   
  //make the bears brown
  fill(182, 95, 0);
   
  //body
  ellipse(bearX, bearY + bHeight/4, bWidth, bHeight/2);
  //head
  ellipse(bearX, bearY - bHeight/5, bWidth/1.5, bHeight/2);
  //ears
  ellipse(bearX - bWidth/4, bearY - bHeight/2.3, bWidth/6, bHeight/10);
  //print(bWidth + "\n");
  ellipse(bearX + bWidth/4, bearY - bHeight/2.3, bWidth/6, bHeight/10);
}
