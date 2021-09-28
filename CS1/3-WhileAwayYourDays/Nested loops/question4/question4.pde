// question 4
// skyscraper

final int numStories = 20;
final int numWindows = 10;

final color windowBlue = color(167, 214, 235);
final color skyScraperGrey = color(47, 63, 74);
final color skyBlue = color(0, 190, 240);
final color grassGreen = color(132, 192, 17);
final color sunYellow = color(250, 253, 15);
final color doorColor = color(190, 160, 150);

final int sunX = 600;
final int sunY = 50;
final int sunSize = 50;

int buildingWidth = 500;
int buildingHeight = 1000;
int windowSize = 60;

int buildingX = 50;
int buildingY = 50;

void setup()
{
  size(700, 1200);
  background(skyBlue);
  fill(grassGreen);
  rect(0, 1000, width,200); 
  fill(sunYellow);
  ellipse(sunX, sunY, sunSize, sunSize);
}

void draw()
{
  fill(skyScraperGrey);
  rect(buildingX, buildingY, 500, 1000);
  
  int row = 0;
  
  while (row < numStories)
  {
    int column  = 0;
    while (column < numWindows)
    {
      int windowX = buildingX + column * buildingWidth / numWindows + 12;
      int windowY = (buildingY + row * (buildingHeight - 30) / numStories) + 15;
      int windowSize = buildingWidth/numWindows - 25;
      
      if (row == numStories -1 && (column == 4 || column == 5))
      {
        fill(doorColor); 
        windowX = buildingX + column * buildingWidth / numWindows;
        windowY = (buildingY + row * (buildingHeight - 30) / numStories) + 20;
        windowSize = buildingWidth/numWindows;
      }
      else
      {
        fill(windowBlue);
      }
      
      rect(windowX, windowY, windowSize, windowSize);

      column++;
    }
    row++;
  }
}
