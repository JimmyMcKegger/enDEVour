String[] countryNames;
int[] numQ1_2013;
int[] numQ2_2013;
int[] numQ3_2013;
int[] numQ4_2013;
int[] numTotal_2013;
int[] numQ1_2014;
int[] numYTD_2014;

int numRows

final String filename = "foreign-student-data.csv";


void setup()
{
  String[] lines = loadStrings(filename);
  
  int numCountries = lines.length - 6;
  
  countryNames = new String[numCountries];
  numQ1_2013 = new int[numCountries];
  numQ2_2013 = new int[numCountries];
  numQ3_2013 = new int[numCountries];
  numQ4_2013 = new int[numCountries];
  numTotal_2013 = new int[numCountries];
  numQ1_2014 = new int[numCountries];
  numYTD_2014 = new int[numCountries];
  
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
    numQ1_2014[countryNum] = Integer.parseInt(splitLine[6]);
    numYTD_2014[countryNum] = Integer.parseInt(splitLine[7]);
    
    println(countryNames[countryNum]);

    lineIndex++; //<>//
  }
  
  
}

void draw ()
{
  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      int index = rowNum*numCols + colNum;
      float circleDiameter = numTotal_2013[index] / 
                       (float)maxTotalStudents
                       * maxCircleWidth;
      final float x = getXCoordinateForRowAndCol(rowNum, colNum);
      final float y = getYCoordinateForRowAndCol(rowNum, colNum);

      colNum++;
    }
  rowNum++;
  }
  
  
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

/*
TODO
A rectangle stroked with grey value 210 centred at the x,y coordinates saved above. Width/height is the maximum circle width and height plus a little extra wiggle room (the demo uses 1/5 of the horizontal and vertical space).
A circle with fill(83, 200, 0) at the x,y coordinates saved above, with the calculated width and height for this country.
A label for the country name with text alignment CENTER, BOTTOM where the bottom is in between the bottom of the circle and the square border. Get the country name from the countryNames array using your index.

*/
