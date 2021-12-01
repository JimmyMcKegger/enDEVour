// Updated International Student Numbers
// The data is from the government of Canada's Open Data website:
// https://open.canada.ca/data/en/dataset/b813dcb6-cc08-4e06-97d4-85b7e4daa822/resource/e86e8769-16c0-4e4c-88fe-504e21a71e43
String[] countryNames;
int[]    num2006;
int[]    num2007;
int[]    num2008;
int[]    num2009;
int[]    num2010;
int[]    num2011;
int[]    num2012;
int[]    num2013;
int[]    num2014;
int[]    num2015;
int[]    numQ1_Q3_2016;

final String filename = "updated-foreign-student-data.csv";


void setup()
{
  // Load in everything from the file
  String[] lines = loadStrings(filename);

  int numCountries = lines.length - 3;
  
  // Now we can create the arrays so we have one slot per country
  countryNames = new String[numCountries];
  num2006 = new int[numCountries];
  num2007 = new int[numCountries];
  num2008 = new int[numCountries];
  num2009 = new int[numCountries];
  num2010 = new int[numCountries];
  num2011 = new int[numCountries];
  num2012 = new int[numCountries];
  num2013 = new int[numCountries];
  num2014 = new int[numCountries];
  num2015 = new int[numCountries];
  numQ1_Q3_2016 = new int[numCountries];
  
  // Next we need to loop over the lines and fill in the arrays
  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    // Skip the first and last three lines
    if (lineIndex < 3)
    {

      lineIndex++;
      continue;
    }
    
    // The country number is not equal to the line index
    int countryNum = lineIndex - 3;
    
    // Break each line apart by separating at the comma
    String[] splitLine = lines[lineIndex].split(",");
    

    countryNames[countryNum] = splitLine[0];
    println(countryNames[countryNum]);
    num2006[countryNum] = Integer.parseInt(splitLine[1]);
    num2007[countryNum] = Integer.parseInt(splitLine[2]);
    num2008[countryNum] = Integer.parseInt(splitLine[3]);
    num2009[countryNum] = Integer.parseInt(splitLine[4]);
    num2010[countryNum] = Integer.parseInt(splitLine[5]);
    num2011[countryNum] = Integer.parseInt(splitLine[6]);
    num2012[countryNum] = Integer.parseInt(splitLine[7]);
    num2013[countryNum] = Integer.parseInt(splitLine[8]);
    num2014[countryNum] = Integer.parseInt(splitLine[9]);
    num2015[countryNum] = Integer.parseInt(splitLine[10]);
    numQ1_Q3_2016[countryNum] = Integer.parseInt(splitLine[11]);
    
    lineIndex++;
  }
  
  int countryNum = 0;
  while (countryNum < numCountries)
  {
    println(countryNames[countryNum]);
    countryNum++;
  }
  
  countryNum = 0;
  while (countryNum < numCountries)
  {
    println(num2006[countryNum]);
    countryNum++;
  }
}
