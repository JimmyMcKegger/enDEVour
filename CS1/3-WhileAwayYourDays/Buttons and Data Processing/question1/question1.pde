// Buttons and Data Processing
// question 1

final color red = color(227, 41, 41);
final color orange = color(255, 165, 0);
final color yellow = color(250, 250, 20);
final color green = color(20, 200, 20);
final color blue = color(30, 50, 250);

final color[] colors = 
{
  red,
  orange,
  yellow,
  green,
  blue
};

color[] buttonColors = 
{
  red,
  orange,
  yellow,
  green,
  blue,
  red,
  orange,
  yellow,
  green,
  blue
};

int spacing = 5;

int totalButtons = 10;
int buttonSize = 50;
int buttonY = 300;
int[] buttonX = new int[totalButtons];

void setup()
{
  size(1000, 600);
  buttonPositions();
}

void draw()
{
  drawbuttons();
} //<>//

void drawbuttons()
{
  int currentButton = 0;
  while (currentButton < totalButtons)
  {
    fill(buttonColors[currentButton]);
    circle(buttonX[currentButton], buttonY, buttonSize);
    currentButton++;
  }
}

void mouseClicked()
{
  for (int i = 0; i < totalButtons; i++)
  {
    if (dist(mouseX, mouseY, buttonX[i], buttonY) < buttonSize/2)
    {
      nextColor(i);
    }
  }
}

void buttonPositions()
{
  int bx = 0;
  while (bx < totalButtons)
  {
    buttonX[bx] = bx * width/totalButtons + buttonSize;
    bx++;
  }
};

void nextColor(int input)
{
  if (buttonColors[input] == blue) //<>//
  {
    buttonColors[input] = colors[0]; //<>//
  }
  else 
  {
    int i = 4; //<>//
    while (i >= 0)
    {
      if (buttonColors[input] == colors[i]) //<>//
      {
        buttonColors[input] = colors[i+1];
      }
      i--; //<>//
    }
  }
}
