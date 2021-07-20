//Product Variants on a Shelf

//Pick a box size with the numbers 1-5, then create a new variant of a random color and your selected size at a random spot on the shelf with the space bar

void setup()
{
  size(800, 600);
  background(backgroundColor);
  rectMode(CENTER);
  strokeWeight(4);
  rect(width/2, height/3, width*0.8, height/4);
}

final int backgroundColor = color(255);

//default size is medium
int variantSize = 50;

int variantX = int(random(width*0.2 + variantSize/2, width*0.8 - variantSize/2));
int variantY = int(height/4 - variantSize/2);

void draw()
{
  strokeWeight(1);
}

// press a number key to select a variant's size
void keyPressed()
{
  switch(key)
  {
    case '1':
      //small box
      variantSize = 20;
      break;
    case '2':
      //medium box
      variantSize = 40;
      break;
    case '3':
      //large box
      variantSize = 75;
      break;
    case '4':
      //extra large box
      variantSize = 100;
      break;
    case '5':
    //huge box
      variantSize = 150;
      break;
    case ' ':
      //Create a new variant variant
      variantX = int(random(width*0.2, width*0.8));
      variantY = int(height/3 + (height/4)/2 - variantSize/2);
      newVariant(variantSize, variantSize, randomColor());
      break;
  }
}

//initialise a new vatiant with it's location and a new colour
void newVariant(int varX, int varY, color varC)  
{
  fill(varC);
  rect(variantX, variantY, variantSize, variantSize);
}

//function to generate random colours
color randomColor()
{ 
  return color(random(255), random(255), random(255));
}
