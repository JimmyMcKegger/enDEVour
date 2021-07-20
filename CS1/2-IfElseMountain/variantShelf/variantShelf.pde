//Product Variants on a Shelf

/*

The program begins by showing an empty shelf.

You have written a self-contained function that abstracts drawing the product variant. The function will need parameters for the x and y position along with at least one other parameter that changes between variants (for example, size or colour). Name your function well to indicate what it accomplishes.

The user can press a number key ('1' through the number of variants) to select the next variant that will appear on the shelf.
 
When the space key is pressed, a new instance of the currently selected variant appears somewhere randomly along the shelf (don't worry if it overlaps with previous variants).
*/

//set the important global variables

final int backgroundColor = color(255);
final int variantWidth = 50;
final int variantHeight = 50;

color variantColor;

void setup()
{
  size(800, 500);
  background(backgroundColor);
  rectMode(CENTER);
  
  //TODO draw a shelf
}

void draw()
{
  
}

// press a number key to add a variant
void keyPressed()
{
  switch(key)
  {
    case '1':
      newVariant(100, 100, randomColor());
      break;
    case '2':
      //TODO
      break;
    case '3':
      //TODO
      break;
    case '4':
      //TODO
      break;
    case '5':
      //TODO
      break;
    case '6':
      //TODO
      break;
    case '7':
      //TODO
      break;
    case '8':
      //TODO
      break;
  }
  
}

//initialise a new vatiant with it's location and a new colour
void newVariant(int varX, int varY, color varC)
{
  fill(varC);
  rect(varX, varY, variantWidth, variantHeight);
}

//function to generate random colours
color randomColor()
{ 
  return color(random(255), random(255), random(255));
}
