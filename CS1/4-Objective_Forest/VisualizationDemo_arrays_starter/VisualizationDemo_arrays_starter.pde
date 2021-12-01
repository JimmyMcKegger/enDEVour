

String[] countryNames;
int[]    numQ1_2013;
int[]    numQ2_2013;
int[]    numQ3_2013;
int[]    numQ4_2013;
int[]    numTotal_2013;

final String filename = "foreign-student-data.csv";


int totalTopNCountries2013;
final int numRows = 4;
final int numCols = 4;

final int maxCircleDiameter = 120;

int graphShowingIndex;



void setup()
{
  size(750,750);
  
  // Get the data from the CSV file
  readData();
  
  // Save how many students there are total for
  // the top 16 countries in 2013 so we don't have
  // to recalculate it all the time
  totalTopNCountries2013 = sumTotalStudentsForTopNCountries(numRows * numCols);
  
  graphShowingIndex = -1;
}


void draw()
{
  background(255);
  
  drawTopNCountries();
  
  if (graphShowingIndex >= 0)
  {
    drawLineGraph(graphShowingIndex);
  }
}


void readData()
{
  String[] lines = loadStrings(filename);
  
  int numCountries = lines.length - 6;
  
  countryNames = new String[numCountries];
 
  numQ1_2013 = new int[numCountries];
  numQ2_2013 = new int[numCountries];
  numQ3_2013 = new int[numCountries];
  numQ4_2013 = new int[numCountries];
  numTotal_2013 = new int[numCountries];
  
  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    if (lineIndex < 3 || lineIndex >= lines.length - 3)
    {
      lineIndex++;
      continue;
    }
    
    int countryNum = lineIndex - 3;
    
    String[] splitLine = lines[lineIndex].split(",");
    
    countryNames[countryNum] = splitLine[0];
    numQ1_2013[countryNum] = Integer.parseInt(splitLine[1]);
    numQ2_2013[countryNum] = Integer.parseInt(splitLine[2]);
    numQ3_2013[countryNum] = Integer.parseInt(splitLine[3]);
    numQ4_2013[countryNum] = Integer.parseInt(splitLine[4]);
    numTotal_2013[countryNum] = Integer.parseInt(splitLine[5]);
    
    lineIndex++;
  }
}

int sumTotalStudentsForTopNCountries(int n)
{
  return 0;
}


int maxTotalStudentsForTopNCountries(int n)
{
  int countryNum = 0;
  int max = -1;
  while (countryNum < n)
  {
    if (max < numTotal_2013[countryNum])
    {
      max = numTotal_2013[countryNum];
    }
 
    countryNum++;
  } 
 
  return max;
}

float getXCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (colNum+1)*getHorizontalSpacing()
         + colNum*maxCircleDiameter  
         + maxCircleDiameter/2;
}

float getYCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (rowNum+1)*getVerticalSpacing()
         + rowNum*maxCircleDiameter 
         + maxCircleDiameter/2;
}

float getHorizontalSpacing()
{
  return (width - numCols*maxCircleDiameter)/(float)(numCols+1);
}

float getVerticalSpacing()
{
  return (height - numRows*maxCircleDiameter)/(float)(numRows+1);
}

void drawTopNCountries()
{
  final int numCircles = numRows * numCols;
  
  final float spaceHor = getHorizontalSpacing();
  final float spaceVer = getVerticalSpacing();
  
  final int maxTotalStudents = maxTotalStudentsForTopNCountries(numCircles);
  
  rectMode(CENTER);
  
  
  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      int index = rowNum*numCols + colNum;
      float circleDiameter = numTotal_2013[index] / (float)maxTotalStudents * maxCircleDiameter;
      final float x = getXCoordinateForRowAndCol(rowNum, colNum);
      final float y = getYCoordinateForRowAndCol(rowNum, colNum);
      
      fill(210);
      
      rect(x, y, width/5, height/5);
      
      float transparency = circleDiameter/float(maxCircleDiameter) * 150 + 100;
      
      fill(83, 200, 0, transparency);
      circle(x, y, circleDiameter);
      
      textAlign(CENTER,BOTTOM);
      fill(0);
      textSize(12);
      text(countryNames[index], x, y + maxCircleDiameter/2 - spaceVer/2, 
           maxCircleDiameter - 20, spaceVer);
      
      colNum++;
    }
    rowNum++;
  }
  
}


void drawLineGraph(int index)
{
  final int padding = 40;
  
  final int rectWidth = (int)(width * 0.8f);
  final int rectHeight = (int)(height * 0.6f);
  
  final int axisX = width/2 - rectWidth/2 + padding;
  final int axisY = height/2 + rectHeight/2 - padding;
  final int axisHeight = rectHeight - 2 * padding;
  
  final int numPoints = 4; // one for each quarter 2013
  
  
  // draw a rectangle around the graph
  stroke(2);
  fill(255);
  rect(width/2, height/2, rectWidth, rectHeight);
  
  // Label country
  fill(0);
  textSize(18);
  textAlign(CENTER, CENTER);
  text(countryNames[index], width/2, height/2 + rectHeight/2 - padding/2);
  
  //Draw axes
  line(axisX, axisY, axisX, height-axisY);
  line(axisX, axisY, width-axisX, axisY);
  
  int spacing = (rectWidth - 2*axisX)/numPoints;
  
  stroke(150, 0, 0);
  
  //TODO draw points from different arrays
}

int getIndexOfCountryAt(int x, int y)
{
  int index = -1; // default: not found
  
  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      int currIndex = rowNum*numCols + colNum;
  
      float currX = getXCoordinateForRowAndCol(rowNum, colNum);
      float currY = getYCoordinateForRowAndCol(rowNum, colNum);
      
      if (x >= currX - maxCircleDiameter/2 && x <= currX + maxCircleDiameter/2 &&
          y >= currY - maxCircleDiameter/2 && y <= currY + maxCircleDiameter/2)
      {
        index = currIndex;
        break;
      }
  
      colNum++;
    }
    rowNum++;
  }
  
  return index;
}


// mouseClicked
void mouseClicked()
{
  if (graphShowingIndex >= 0)
  {
    graphShowingIndex = -1;    
  }
  else
  {
    graphShowingIndex = getIndexOfCountryAt(mouseX, mouseY);
  }
}
