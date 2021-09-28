// question 1
// Draw a 2x2 checker board. 

final color yellow = color(210, 150, 0);
final color red = color(220, 35, 0);
final color black = color(0);

final int totalRows = 2;
final int totalColumns = 2;

int redSquare = 0;

void setup()
{
  size(400, 400);
  background(yellow);
}

void draw()
{
  int row = 0;
  while (row < totalRows)
  {
    int column  = 0;
    while (column < totalColumns)
    {
      if (redSquare % 2 == 0)
      {
        fill(red);
      }
      else
      {
        fill(black);
      }
      
      int squareX = column * width/2;
      int squareY = row * height/2;
      int squareSize = height/2 - 2;

      rect(squareX, squareY, squareSize, squareSize);
      
      redSquare++;
      column++;
    }
    redSquare++;
    row++;
  }
  
}
