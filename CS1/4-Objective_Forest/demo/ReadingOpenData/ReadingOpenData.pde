// This demo shows how to read and process a comma-separated
// value file with data about what countries foreign students
// in Canada are coming from.

// The data is from the government of Canada's Open Data website:
// http://data.gc.ca/eng
// http://data.gc.ca/data/en/dataset/cdc14bcf-d9b1-4130-b743-6830f25c9b64

// The data needs a bit of processing first: open in Excel or similar,
// convert the type of data for the numbers to text, and resave the CSV.
// This ensures numbers greater than one thousand are written like XXXX
// rather than "X,XXX"


// Set up arrays to store information about each country - 
// we will fill them in once we load the file in setup
String[] countryNames;
int[]    numQ1_2013;
int[]    numQ2_2013;
int[]    numQ3_2013;
int[]    numQ4_2013;
int[]    numTotal_2013;
int[]    numQ1_2014;
int[]    numYTD_2014;

final String filename = "foreign-student-data.csv";


void setup()
{
  // Load in everything from the file
  String[] lines = loadStrings(filename);
  
  // Looking at the data, we know that there are three informational
  // lines of text at the top of the file, and three at the bottom.
  // Therefore, the length of lines is 6 more than the number of
  // countries we are dealing with.
  int numCountries = lines.length - 6;
  
  // Now we can create the arrays so we have one slot per country
  countryNames = new String[numCountries];
  numQ1_2013 = new int[numCountries];
  numQ2_2013 = new int[numCountries];
  numQ3_2013 = new int[numCountries];
  numQ4_2013 = new int[numCountries];
  numTotal_2013 = new int[numCountries];
  numQ1_2014 = new int[numCountries];
  numYTD_2014 = new int[numCountries];
  
  // Next we need to loop over the lines and fill in the arrays
  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    // Skip the first and last three lines
    if (lineIndex < 3 || lineIndex >= lines.length - 3)
    {
      // The continue keyword lets us cancel this iteration
      // of the loop, as though we could magically teleport
      // back to the beginning of the racetrack and carry on
      // from there.  We do need to update the line index
      // first, though, so that we are ready for the next lap.
      lineIndex++;
      continue;
    }
    
    // The country number is not equal to the line index
    int countryNum = lineIndex - 3;
    
    // Break each line apart by separating at the comma
    String[] splitLine = lines[lineIndex].split(",");
    
    // We know what order the data in the file is listed in,
    // so we can just grab it and put it into the appropriate
    // array.  For numbers, we have to convert from String
    // to int.
    
    countryNames[countryNum] = splitLine[0];
    numQ1_2013[countryNum] = Integer.parseInt(splitLine[1]);
    numQ2_2013[countryNum] = Integer.parseInt(splitLine[2]);
    numQ3_2013[countryNum] = Integer.parseInt(splitLine[3]);
    numQ4_2013[countryNum] = Integer.parseInt(splitLine[4]);
    numTotal_2013[countryNum] = Integer.parseInt(splitLine[5]);
    numQ1_2014[countryNum] = Integer.parseInt(splitLine[6]);
    numYTD_2014[countryNum] = Integer.parseInt(splitLine[7]);
    
    lineIndex++;
  }
  
  // Now that everything is read in, let's test a couple
  // of the arrays to make sure we did it right
  
  int countryNum = 0;
  while (countryNum < numCountries)
  {
    println(countryNames[countryNum]);
    countryNum++;
  }
  
  countryNum = 0;
  while (countryNum < numCountries)
  {
    println(numTotal_2013[countryNum]);
    countryNum++;
  }
}
