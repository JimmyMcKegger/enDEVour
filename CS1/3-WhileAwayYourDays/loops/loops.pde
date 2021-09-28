
int circleRowNum = 0;
int numRows = 12;
int circleColNum = 0;
int numCols = 12;
int spaceBetween = 20;
int diameter = 10;

void setup()
{
  size(370, 370);
}

void draw()
{
  while (circleRowNum < numRows)
  {
    int circleColNum = 0;
    while (circleColNum < numCols)
    {
      int ellipseX = (circleColNum+1)*spaceBetween + (circleColNum)*diameter;
      int ellipseY = (circleRowNum+1)*spaceBetween + (circleRowNum)*diameter;
 
      ellipse(ellipseX, ellipseY, diameter, diameter);
 
      circleColNum++;
    }
    circleRowNum++;
  }
}
