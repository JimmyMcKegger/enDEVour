final int rectWidth = 50;
int rectHeight = 50;
int rectY;

int largest;
int largestIndex = 0;

color orange = color(252, 192, 144);
color blue = color(144, 192, 252);

int[] data = new int[10];

void setup()
{
  size(600,500);
  
  fillArray(data);
  findMax(data);
  
  rectY = height/3 - rectHeight/2 - largest*5;
}


void draw()
{
  drawData();
}


void drawData()
{
  int spaceBetween = (width - (data.length*rectWidth)) / (data.length+1);
  
  int i = 0;
  int currX = spaceBetween;
  while (i < data.length)
  {
    fill(i == largestIndex ? orange : blue);
    rectHeight = 40 + 20*(data[i]);
    rect(currX, rectY, rectWidth, rectHeight); //<>//
    
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(data[i], currX + rectWidth/2, rectY + rectHeight/2);
    
    i++;
    currX += rectWidth + spaceBetween;
  }
}

void fillArray(int[] arr)
{  
  for (int i = 0; i < arr.length; i++)
  {
    arr[i] = int(random(1, 20));
  }
}

void findMax(int[] arr)
{
  largest = arr[0];
  
  for (int i = 0; i < arr.length; i++)
  {
    if (arr[i] > largest)
    {
      largest = arr[i];
      largestIndex = i;
    }
  }
}
