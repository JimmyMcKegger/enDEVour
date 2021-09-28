// question 3
// Multiplication tables

final int numSquares = 10;


void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  int row = 0;
  while (row < numSquares)
  {
    int column  = 0;
    while (column < numSquares)
    {
      
      int squareX = column * width/numSquares;
      int squareY = row * height/numSquares;
      int squareSize = height/numSquares;
      
      int res;
      
      if (row == 0)
      {
        res = column;
      }
      else if (column == 0)
      {
        res = row;
      }
      else
      {
        res = row * column;
      }

      fill(255);
      rect(squareX, squareY, squareSize, squareSize);
      fill(0);
      text(res, squareX + squareSize/2 - 5, squareY + squareSize/2 + 5); //<>//
      
      column++;
    }
    row++;
  }
}
