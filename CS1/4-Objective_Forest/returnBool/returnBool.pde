//A Function that Returns a Random Bool

float input = 0.75;
int testNumber = 1000;

void setup()
{
  int trueCount = 0;
  
  int testCount = 0;
  while (testCount < testNumber)
  {
    if(randomBool(input))
    {
      trueCount++;
    }
    testCount++;
  }
  println("Input: " + input);
  println("Result: " + trueCount + " / " + testNumber + " returned 'true'");
}

boolean randomBool(float p)
{
  float x = random(1.0);
  if (x < p)
  {
    return true;
  }
  else
  {
    return false;
  }
}
