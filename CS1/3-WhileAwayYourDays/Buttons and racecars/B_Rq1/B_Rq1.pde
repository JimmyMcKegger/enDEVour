// Parallel Arrays for Buttons and Racecars
// question 1

int n = 10; //number of rectangles

float[] rectX = new float[n];
color[][] rectColor = new color[n][2];
boolean[] swap = new boolean[n];

int rectY;
float rectWidth;
float rectHeight;
color fullBlue = color(0, 0, 255);
int spacing = 5;

void setup() 
{
  size(1200, 900);
  
  rectY = height/4;
  rectWidth = (width / n) * 0.9;
  rectHeight = height/ 2;
  
  int rectPosition = 0;
  while (rectPosition < n)
  {
    rectX[rectPosition] = (rectPosition * width / n) + spacing;
    swap[rectPosition] = false;
    
    rectColor[rectPosition][0] = fullBlue;
    rectColor[rectPosition][1] = color(red(fullBlue) + 255/n * rectPosition + 1,
                                       random(50,200), 
                                       blue(fullBlue) - 255/n * rectPosition + 1,
                                       random(130, 190));
    rectPosition++;
  }
}

void draw()
{
  background(255);
  
  int r = 0;
  while (r < n)
  {
    fill(rectColor[r][swap[r]?1:0]);
    rect(rectX[r], rectY, rectWidth, rectHeight);
    r++;
  }
  
  updateColors();
}

void updateColors()
{
  if (mouseY >= rectY &&
      mouseY <= rectY + rectHeight)
  {
    int rectCheck = 0;
    while (rectCheck < n)
    {
     if (mouseX >= rectX[rectCheck] &&
         mouseX <= rectX[rectCheck] + rectWidth)
         {
           swap[rectCheck] = true;
         }
         else
         {
           swap[rectCheck] = false;
         }
     rectCheck++; 
    }
  }
}
