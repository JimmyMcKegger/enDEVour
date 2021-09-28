// question 2
// numSquares

final int numSquares = 20;

final color yellow = color(210, 150, 0);
final color red = color(220, 35, 0);
final color black = color(0);

int redSquare = 0;

void setup()
{
  size(400, 400);
  background(yellow);
}

void draw()
{
  int row = 0;
  while (row < numSquares)
  {
    int column  = 0;
    while (column < numSquares)
    {
      fill(redSquare % 2 == 0 ? red : black);
      
      int squareX = column * width/numSquares;
      int squareY = row * height/numSquares;
      int squareSize = height/numSquares - 2;

      rect(squareX, squareY, squareSize, squareSize);
      
      redSquare++;
      column++;
    }
    redSquare++;
    row++;
  }
}
