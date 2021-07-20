//Random and Monsters

//question 1

final color yellow = color(227, 244, 5);
final color green = color(30, 160, 6);

final int circleRadius = 15;

void setup()
{
  frameRate(80);
  size (600, 500);
  background(green);

}

void draw()
{
  fill(yellow);
  circle(random(width), random(height), circleRadius);
}
